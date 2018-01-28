/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "simplec.y" /* yacc.c:339  */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <time.h>
#include "gen-hash.h"
#include "boolnet.h"
#include "ast.h"
#define YYSTYPE node_ptr

#define DEBUG 0

/* Current line number.  Maintained by lex */
int lineno = 1;
#define ERRLIM 0

int errlim = ERRLIM;
int timelim = 0; /* Max number of seconds for BDD checker (0 means infinity) */

int errcnt = 0;

FILE *outfile = NULL;
FILE *infofile = NULL;
extern FILE *yyin;

char *infilename = NULL;
/* Optional pattern giving type information about arguments */
char *argpattern = NULL;
char *function_name = NULL;
node_ptr function_body = NULL;
node_ptr return_type = NULL;
/* Current type of declared variables */
node_ptr default_type = NULL;

int yyparse(void);
int yylex(void);

/* Utility functions */
/* Handle timeouts */
void timeout_handler(int sig)
{
  fprintf(infofile, "Timeout: Checking exceeded %d seconds\n", timelim);
  exit(0);
}

/* Finishing message */
 void finish()
 {
   exit(0);
 } 

void yyerror(const char *str)
{
  fprintf(stdout, "Error, %s:%d: %s\n",
	  infilename ? infilename : "", lineno, str);
  if (++errcnt > errlim) {
      fprintf(stdout, "Too many errors, aborting\n");
      exit(1);
  }
  exit(1);
}

static char errmsg[1024];
void yyserror(const char *str, char *other)
{
    sprintf(errmsg, str, other);
    yyerror(errmsg);
}

int yywrap()
{
  return 1;
}

/* Count number of newlines in string */  
int count_returns(char *s) {
  int result = 0;
  int c = 0;
  while ((c = *s++) != '\0')
    result += (c == '\n');
  return result;
}

static void usage(char *name)
{
  fprintf(stdout, "Usage: %s [-r][-s][-a argpattern] f1.c f2.c ... [-o out.cnf][-e errlim][-u unrolllim] [-t timelim]\n", name);
  fprintf(stdout, " -r: Only test for runtime errors (uninitialized vars., etc.)\n");  
  fprintf(stdout, " -s: Set up SAT problem, rather than using BDDs\n");
  fprintf(stdout, " -u lim: Limit maximum number of times loop is repeated\n");
  fprintf(stdout, " -t secs: Limit number of seconds for BDD checking\n");
  fprintf(stdout, " -a argpattern: Specify argument ranges\n");
  fprintf(stdout, " -C: Disable casting (implicit & explicit) in first code file\n");
  fprintf(stdout, " -d dumpfile: Dump counterexample BDD\n");
  fprintf(stdout, "Argpattern of form pat1:pat2:...:patn\n");
  fprintf(stdout, "Possible patterns:\n");
  fprintf(stdout, "  Default: Same as t%d\n", LSIZE);
  fprintf(stdout, "  tK: K-bit, two's complement representation\n");
  fprintf(stdout, "  uK: K-bit, unsigned representation\n");
  fprintf(stdout, "  [lower,upper]: Give specific value range\n");
  fprintf(stdout, " -o outfile: Specify output CNF file\n");
  exit(0);
}

int main(int argc, char **argv)
{
    /* When have single function, Check whether always returns 1 */
    bvec_ptr ref_rval = int_const(1); 
    bvec_ptr new_rval;
    /* AST for function */
    node_ptr fnode;
    /* Do all functions satisfy runtime constraints? */
    op_ptr all_runtime = one();
    /* What are the conditions for out of range arguments */
    op_ptr bad_args = zero();
    /* Do all of the function results match? */
    op_ptr all_rm = one();
    /* Latest computation of runtime and results match */
    op_ptr runtime;
    op_ptr rm;
    eval_status_ele status;
    int runtime_only = 0;
    int cnt = 0;
    int use_bdds = 1;
    int cast_ok = 1;
    int i;
    int unroll_limit = 33;
    int found_runtime_error = 0;
    char *dumpfilename = NULL;

    clock_t start_time = clock();


    argpattern = NULL;
    outfile = stdout;
    infofile = stdout;

    default_type = cast_node(ISIZE, DATA_SIGNED, NULL);
    return_type = cast_node(ISIZE, DATA_SIGNED, NULL);

    /* Make two passes through arguments.  First, pick up all options */
    for (i = 1; i < argc; i++) {
	if (argv[i][0] != '-')
	  continue;
	/* Parse options */
	switch (argv[i][1]) {
	case 'h': usage(argv[0]);
	  break;
	case 'r': runtime_only = 1;
	  break;
	case 's': use_bdds = 0;
	  break;
	case 'C': cast_ok = 0;
	  break;
        case 'u': unroll_limit = atoi(argv[++i]);
          break;
        case 't': timelim = atoi(argv[++i]);
          break;
	case 'd': dumpfilename = argv[++i];
	  break;
	case 'o': 
	  outfile = fopen (argv[++i], "w");
	  if (!outfile) {
	    yyserror("Couldn't open output file '%s'", argv[i]);
	    exit(1);
	  }
	  break;
	case 'a':
	  argpattern = argv[++i];
	  break;
	case 'e':
	  errlim = atoi(argv[++i]);
	  break;
	default:
	  usage(argv[0]);
	  break;
	}
    }
    /* Set up signal handler when using BDDs */
    if (timelim > 0) {
      signal(SIGALRM, timeout_handler);
    }
    /* Second pass.  Process C files */
    init_ast_gen();
    init_ast_eval(argpattern);
    
    for (i = 1; i < argc; i++) {
      if (*argv[i] == '-') {
	char opt = argv[i][1];
	if (opt == 'a' || opt == 'o' || opt == 'e' || opt == 'u' || opt == 't' || opt == 'd')
	  i++;
	continue;
      }
      infilename = strsave(argv[i]);
      yyin = fopen(infilename, "r");
      if (!yyin) {
	yyserror("Couldn't open file '%s'", infilename);
	exit(1);
      }
      init_ast_gen();
      lineno = 1;
      if (yyparse())
	exit(1);
      new_rval = eval_ast(function_body, return_type, unroll_limit, &status);
      if (cnt == 0 && !cast_ok && status.casting > 0) {
	fprintf(infofile, "Disallowed casting in file %s\n", infilename);
      }
      runtime = status.all_ok;
      bad_args = status.bad_args;
      if (runtime != one()) {
	  if (use_bdds) {
	      if (timelim > 0) {
	          alarm(timelim);
	      }
	      if (gen_solve(NULL, not_op(runtime))) {
		  fprintf(infofile, "Runtime error(s) in file %s\n", infilename);
		  found_runtime_error = 1;
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.incomplete_loop)) {
		      fprintf(infofile, "Loop failed to terminate within %d iterations: ",
			      unroll_limit);
		      gen_solve(infofile, status.incomplete_loop);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.uninitialized_variable)) {
		      fprintf(infofile, "Variable used before being initialized: ");
		      gen_solve(infofile, status.uninitialized_variable);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.missing_return)) {
		      fprintf(infofile, "No return executed: ");
		      gen_solve(infofile, status.missing_return);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.uncaught_break)) {
		      fprintf(infofile, "Uncaught break statement: ");
		      gen_solve(infofile, status.uncaught_break);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.uncaught_continue)) {
		      fprintf(infofile, "Uncaught continue statement: ");
		      gen_solve(infofile, status.uncaught_continue);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.mem_error)) {
		      fprintf(infofile, "Memory or array referencing error: ");
		      gen_solve(infofile, status.mem_error);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.div_error)) {
		      fprintf(infofile, "Zero divide error: ");
		      gen_solve(infofile, status.div_error);
		      finish();
		  }
		  if (timelim > 0) alarm(timelim);
		  if (gen_solve(NULL, status.shift_error)) {
		      fprintf(infofile, "Invalid shift error: ");
		      gen_solve(infofile, status.shift_error);
		      finish();
		  }
	      }
	  } else {
	      fprintf(infofile, "Warning: possible runtime error in file %s\n",
		infilename);
	      if (status.incomplete_loop != zero())
		  fprintf(infofile,
			  "  Loop possibly did not terminate within %d iterations\n", unroll_limit);
	      if (status.uninitialized_variable != zero())
		  fprintf(infofile,
			  "  Possibly used variable that had not been initialized\n");
	      if (status.missing_return != zero())
		  fprintf(infofile,
			  "  Possibly failed to execute return statement\n");
	      if (status.uncaught_break != zero())
		  fprintf(infofile,
			  "  Possibly failed to catch break statement\n");
	      if (status.uncaught_continue != zero())
		  fprintf(infofile,
			  "  Possibly failed to catch continue statement\n");
	      if (status.mem_error != zero())
		  fprintf(infofile,
			  "  Possible memory or array referencing error\n");
	      if (status.div_error != zero())
		  fprintf(infofile,
			  "  Possible zero divide error\n");
	      if (status.shift_error != zero())
		  fprintf(infofile,
			  "  Possible shift error\n");
	  }
      }

      all_runtime = and_op(runtime, all_runtime);
      cnt++;
      if (!runtime_only) {
	rm = or_op(bad_args, int_eq(ref_rval, new_rval));
	if (cnt == 1) {
	  /* Save this as reference value
	     in case do further comparisons */
	  ref_rval = new_rval;
	}
	if (cnt == 2) {
	  /* Special case of switching from single predicate function
	     to comparing multiple functions */
	  all_rm = rm;
	} else
	  all_rm = and_op(all_rm, rm);
      }
    }

    if (use_bdds) {
      op_ptr check;
      if (!found_runtime_error) {
	fprintf(infofile, "Bug Condition ");
	if (timelim > 0) {
	  alarm(timelim);
	}
	check = not_op(and_op(all_rm, all_runtime));
	gen_solve(infofile, check);
	if (dumpfilename != NULL) {
	  /* Dump vector of nonzero functions */
	  int dump_cnt = ISIZE;
	  int i;
	  while (dump_cnt > 1 && ref_rval->bits[dump_cnt-1] == zero())
	    dump_cnt--;
	  FILE *fp = fopen(dumpfilename, "w");
	  op_ptr *funct_set = calloc(sizeof(op_ptr), dump_cnt);
	  char **funct_names = calloc(sizeof(char *), dump_cnt);
	  for (i = 0; i < dump_cnt; i++) {
	    char buf[16];
	    funct_set[i] = ref_rval->bits[i];
	    sprintf(buf, "F_%d", i);
	    funct_names[i] = strsave(buf);
	  }
	  if (!fp) {
	    fprintf(stderr, "Couldn't open dump file '%s'\n", dumpfilename);
	    exit(1);
	  }
	  dump_blif(fp, dump_cnt, funct_set, funct_names);
	  fclose(fp);
	}
      }
    }
    else
      gen_cnf(outfile, infofile, not_op(and_op(all_rm, all_runtime)));
    fprintf(infofile, "Time: %.2f sec.\n",
	    (clock() - start_time)/(double) CLOCKS_PER_SEC);
    finish();
    return 0;
}

int old_main(int argc, char **argv)
{
  int i;
  init_ast_eval(NULL);
  init_ast_gen();
  default_type = cast_node(ISIZE, DATA_SIGNED, NULL);
  return_type = cast_node(ISIZE, DATA_SIGNED, NULL);
  for (i = 1; i < argc; i++) {
    infilename = strsave(argv[i]);
    yyin = fopen(infilename, "r");
    if (!yyin) {
      yyserror("Couldn't open file '%s'", infilename);
      exit(1);
    }
    lineno = 1;
    if (yyparse())
      exit(1);
    printf("Function %s:\n", function_name);
    show_node(stdout, function_body, 1);
  }
}


#line 446 "simplec.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "simplec.tab.h".  */
#ifndef YY_YY_SIMPLEC_TAB_H_INCLUDED
# define YY_YY_SIMPLEC_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VAR = 258,
    INT = 259,
    FLOAT = 260,
    VOID = 261,
    UNSIGNED = 262,
    LONG = 263,
    SHORT = 264,
    CHAR = 265,
    NUM = 266,
    SEMI = 267,
    COMMA = 268,
    LPAREN = 269,
    RPAREN = 270,
    LBRACE = 271,
    RBRACE = 272,
    LBRACK = 273,
    RBRACK = 274,
    ASSIGN = 275,
    CARATASSIGN = 276,
    AMPASSIGN = 277,
    STARASSIGN = 278,
    PLUSASSIGN = 279,
    MINUSASSIGN = 280,
    BARASSIGN = 281,
    LEFTSHIFTASSIGN = 282,
    RIGHTSHIFTASSIGN = 283,
    SLASHASSIGN = 284,
    PERCENTASSIGN = 285,
    PLUSPLUS = 286,
    MINUSMINUS = 287,
    AMPAMP = 288,
    BARBAR = 289,
    TILDE = 290,
    BANG = 291,
    CARAT = 292,
    AMP = 293,
    BAR = 294,
    STAR = 295,
    PLUS = 296,
    MINUS = 297,
    SLASH = 298,
    PERCENT = 299,
    LESSLESS = 300,
    GREATERGREATER = 301,
    COLON = 302,
    QUESTION = 303,
    NOTEQUAL = 304,
    EQUAL = 305,
    LESS = 306,
    LESSEQUAL = 307,
    GREATER = 308,
    GREATEREQUAL = 309,
    RETURN = 310,
    IF = 311,
    ELSE = 312,
    WHILE = 313,
    DO = 314,
    FOR = 315,
    BREAK = 316,
    CONTINUE = 317,
    CASE = 318,
    SWITCH = 319,
    DEFAULT = 320,
    SIZEOF = 321
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SIMPLEC_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 564 "simplec.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  19
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   626

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  67
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  17
/* YYNRULES -- Number of rules.  */
#define YYNRULES  114
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  225

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   321

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   406,   406,   412,   413,   414,   415,   416,   417,   418,
     419,   420,   421,   422,   423,   424,   425,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   435,   436,   437,   440,
     441,   442,   443,   446,   447,   451,   452,   453,   454,   455,
     456,   457,   460,   465,   470,   471,   472,   473,   475,   476,
     480,   481,   482,   483,   487,   488,   489,   493,   495,   500,
     501,   505,   506,   507,   508,   509,   510,   511,   512,   513,
     514,   515,   516,   517,   518,   519,   523,   524,   525,   526,
     527,   528,   529,   530,   531,   532,   533,   534,   535,   536,
     537,   538,   539,   543,   544,   551,   552,   556,   557,   558,
     560,   562,   564,   566,   568,   570,   572,   577,   579,   585,
     586,   591,   592,   596,   597
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "VAR", "INT", "FLOAT", "VOID",
  "UNSIGNED", "LONG", "SHORT", "CHAR", "NUM", "SEMI", "COMMA", "LPAREN",
  "RPAREN", "LBRACE", "RBRACE", "LBRACK", "RBRACK", "ASSIGN",
  "CARATASSIGN", "AMPASSIGN", "STARASSIGN", "PLUSASSIGN", "MINUSASSIGN",
  "BARASSIGN", "LEFTSHIFTASSIGN", "RIGHTSHIFTASSIGN", "SLASHASSIGN",
  "PERCENTASSIGN", "PLUSPLUS", "MINUSMINUS", "AMPAMP", "BARBAR", "TILDE",
  "BANG", "CARAT", "AMP", "BAR", "STAR", "PLUS", "MINUS", "SLASH",
  "PERCENT", "LESSLESS", "GREATERGREATER", "COLON", "QUESTION", "NOTEQUAL",
  "EQUAL", "LESS", "LESSEQUAL", "GREATER", "GREATEREQUAL", "RETURN", "IF",
  "ELSE", "WHILE", "DO", "FOR", "BREAK", "CONTINUE", "CASE", "SWITCH",
  "DEFAULT", "SIZEOF", "$accept", "funct", "type", "arglist", "statements",
  "statement", "decllist", "decl", "adecl", "vexpr", "uexpr", "expr",
  "qexpr", "aexpr", "cexpr", "iexpr", "iexprlist", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321
};
# endif

#define YYPACT_NINF -61

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-61)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     130,   -61,   -61,   106,    45,   123,    -1,     9,     0,   -61,
       7,    17,   -61,   -61,    33,   137,   -61,    43,   -61,   -61,
      42,   -61,   -61,    73,   -61,   -61,   -61,   109,   -61,   115,
     -61,   -61,   -61,     2,    20,   -61,   130,   101,     5,   -61,
     -61,   144,   119,   -61,   -61,   312,   -61,   -61,   126,   126,
     396,   396,   126,   126,   396,   396,   128,   136,   272,   164,
     173,   189,   396,   200,   112,   207,    11,   -61,   269,   -61,
      21,   -61,   -61,   160,   396,    -8,   149,   208,   -61,   205,
     205,   -14,   -61,   -61,   205,   205,   -61,   185,   396,   396,
     176,   396,   -61,   -61,   191,   396,   272,   130,   -61,   224,
     145,   -61,   396,   396,   396,   396,   396,   396,   396,   396,
     396,   396,   396,   396,   -61,   -61,   396,   396,   396,   396,
     396,   396,   396,   396,   396,   396,   396,   396,   396,   396,
     396,   396,   396,   396,   396,   -61,   396,   154,   396,   -61,
     -61,   -61,   155,   168,   231,   229,   272,   180,   -61,    -2,
     -61,   244,   348,   360,   439,   -61,   -61,   -61,   -61,   -61,
     -61,   -61,   -61,   -61,   -61,   -61,   507,   489,   542,   557,
     525,   -61,   -24,   -24,   -61,   -61,   147,   147,   202,   572,
     572,   186,   186,   186,   186,   -61,   -61,   -61,   272,   272,
     396,   396,   -61,   272,   -61,   145,   -61,   -61,   467,   360,
     -61,   -61,   -61,   396,   196,   -61,   181,   239,   -61,   -61,
     -61,   241,   238,   -61,   272,   245,   396,   360,   -61,   -61,
     -61,   220,   -61,   272,   -61
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    22,    27,     3,    24,    20,    21,     0,     0,    14,
       4,    10,    12,    23,     5,    26,    19,    11,    13,     1,
       0,    28,    16,     6,     8,    15,    25,     7,     9,    29,
      18,    17,    30,     0,     0,    31,     0,     0,     0,    33,
      32,     0,    59,    62,    37,     0,    33,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,    61,    76,
      95,    97,   109,     0,     0,     0,     0,     0,    59,    72,
      71,    61,    66,    65,    73,    74,    67,     0,     0,     0,
       0,     0,    39,    40,     0,     0,     0,     0,    54,     0,
      50,    51,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    69,    70,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,     0,     0,    63,
      46,    38,     0,     0,     0,     0,     0,     0,    49,     0,
      35,     0,     0,     0,     0,    98,    99,   100,   101,   102,
     105,   106,   107,   108,   103,   104,    93,    94,    91,    90,
      92,    77,    78,    79,    80,    81,    82,    83,     0,    89,
      88,    84,    85,    86,    87,   110,    75,    64,     0,     0,
       0,     0,    48,     0,    68,    52,    53,    56,     0,     0,
      57,    58,    60,     0,    45,    41,     0,     0,    47,    55,
     111,   113,     0,    96,     0,     0,     0,     0,   112,    44,
      42,     0,   114,     0,    43
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -61,   -61,    12,   -61,   210,   -57,   -61,   107,   108,   -26,
     -20,   323,   -60,   -25,   -45,   125,    44
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     7,    66,    34,    41,    67,    99,   100,   101,    68,
      69,    70,    71,    72,    73,   211,   212
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      76,    90,    94,    20,   102,    35,    18,   138,    40,    19,
      87,    22,     8,   194,    98,    23,   121,   114,   115,   124,
     125,    24,    79,    80,    81,    81,    84,    85,    81,   137,
      82,    83,    21,    36,    86,    37,    81,    25,    21,   148,
      21,    33,    21,   142,   143,    21,   145,    28,    38,    13,
     147,    21,    14,    15,   116,   117,    29,    75,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   178,   128,
     129,   130,   131,   132,   133,   134,    81,    30,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   192,
      81,    81,    81,    81,    81,    81,    81,    81,    81,    81,
      81,    81,    81,    81,    81,    81,    81,    81,    81,   149,
       9,   185,    81,    31,    10,    11,    12,    39,   187,     1,
       2,    32,     3,     4,     5,     6,    81,    16,   200,    78,
      17,   204,   205,    74,     1,     2,   208,     3,     4,     5,
       6,    26,    88,   213,    27,   206,   207,    42,     1,     2,
      89,     3,     4,     5,     6,    43,    44,   219,    45,    96,
      46,    47,   136,   152,   139,   153,   224,   136,   136,   186,
     188,   221,   135,   136,   210,    48,    49,    81,    91,    50,
      51,   136,    52,   189,    53,    92,    54,   121,   122,   123,
     124,   125,   210,   136,   136,   193,   215,   141,   136,    55,
      56,    93,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    42,     1,     2,    95,     3,     4,     5,     6,    43,
      44,    97,    45,   102,    46,   140,   121,   122,   123,   124,
     125,   126,   127,   136,   144,   223,   150,   151,   146,    48,
      49,   191,   136,    50,    51,   190,    52,    98,    53,   203,
      54,   216,   136,   214,   217,   218,    77,   220,   195,   196,
       0,   222,     0,    55,    56,     0,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    42,     1,     2,   201,     3,
       4,     5,     6,    43,    44,     0,    45,   102,    46,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,     0,    48,    49,     0,     0,    50,    51,     0,
      52,     0,    53,     0,    54,    42,     1,     2,     0,     3,
       4,     5,     6,    43,     0,     0,    45,    55,    56,     0,
      57,    58,    59,    60,    61,    62,    63,    64,    65,     0,
       0,     0,     0,    48,    49,     0,     0,    50,    51,     0,
      52,    42,    53,     0,    54,     0,     0,     0,     0,    43,
       0,     0,    45,    42,     0,     0,     0,   197,     0,     0,
       0,    43,     0,     0,    45,     0,   199,     0,    65,    48,
      49,     0,     0,    50,    51,     0,    52,     0,    53,     0,
      54,    48,    49,     0,     0,    50,    51,     0,    52,    42,
      53,     0,    54,     0,     0,     0,     0,    43,     0,     0,
      45,     0,     0,     0,    65,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   154,    65,    48,    49,     0,
       0,    50,    51,     0,    52,     0,    53,     0,    54,   166,
     167,   168,   169,   170,   171,   172,   173,   174,   175,   176,
     177,     0,   179,   180,   181,   182,   183,   184,   202,     0,
       0,     0,    65,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   116,   117,     0,   198,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   209,     0,   129,   130,
     131,   132,   133,   134,     0,     0,     0,     0,     0,     0,
     116,   117,     0,     0,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,     0,     0,   129,   130,   131,   132,
     133,   134,   116,     0,     0,     0,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,     0,     0,   129,   130,
     131,   132,   133,   134,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,     0,     0,   129,   130,   131,   132,
     133,   134,   118,   119,     0,   121,   122,   123,   124,   125,
     126,   127,     0,     0,   129,   130,   131,   132,   133,   134,
     119,     0,   121,   122,   123,   124,   125,   126,   127,     0,
       0,   129,   130,   131,   132,   133,   134,   121,   122,   123,
     124,   125,   126,   127,     0,     0,   129,   130,   131,   132,
     133,   134,   121,   122,   123,   124,   125,   126,   127,     0,
       0,     0,     0,   131,   132,   133,   134
};

static const yytype_int16 yycheck[] =
{
      45,    58,    62,     3,    18,     3,     7,    15,     3,     0,
      55,     4,     0,    15,     3,     8,    40,    31,    32,    43,
      44,     4,    48,    49,    50,    51,    52,    53,    54,    74,
      50,    51,    40,    13,    54,    15,    62,     4,    40,    96,
      40,    29,    40,    88,    89,    40,    91,     4,    36,     4,
      95,    40,     7,     8,    33,    34,    14,    45,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,   128,    48,
      49,    50,    51,    52,    53,    54,   102,     4,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   146,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,    97,
       4,   136,   138,     4,     8,     9,    10,    16,   138,     4,
       5,     6,     7,     8,     9,    10,   152,     4,   153,     3,
       7,   188,   189,    14,     4,     5,   193,     7,     8,     9,
      10,     4,    14,   203,     7,   190,   191,     3,     4,     5,
      14,     7,     8,     9,    10,    11,    12,   214,    14,    47,
      16,    17,    13,    18,    15,    20,   223,    13,    13,    15,
      15,   216,    12,    13,   199,    31,    32,   203,    14,    35,
      36,    13,    38,    15,    40,    12,    42,    40,    41,    42,
      43,    44,   217,    13,    13,    15,    15,    12,    13,    55,
      56,    12,    58,    59,    60,    61,    62,    63,    64,    65,
      66,     3,     4,     5,    14,     7,     8,     9,    10,    11,
      12,    14,    14,    18,    16,    17,    40,    41,    42,    43,
      44,    45,    46,    13,    58,    15,    12,    13,    47,    31,
      32,    12,    13,    35,    36,    14,    38,     3,    40,    47,
      42,    12,    13,    57,    13,    17,    46,    12,   151,   151,
      -1,   217,    -1,    55,    56,    -1,    58,    59,    60,    61,
      62,    63,    64,    65,    66,     3,     4,     5,   153,     7,
       8,     9,    10,    11,    12,    -1,    14,    18,    16,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    -1,    31,    32,    -1,    -1,    35,    36,    -1,
      38,    -1,    40,    -1,    42,     3,     4,     5,    -1,     7,
       8,     9,    10,    11,    -1,    -1,    14,    55,    56,    -1,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    -1,
      -1,    -1,    -1,    31,    32,    -1,    -1,    35,    36,    -1,
      38,     3,    40,    -1,    42,    -1,    -1,    -1,    -1,    11,
      -1,    -1,    14,     3,    -1,    -1,    -1,    19,    -1,    -1,
      -1,    11,    -1,    -1,    14,    -1,    16,    -1,    66,    31,
      32,    -1,    -1,    35,    36,    -1,    38,    -1,    40,    -1,
      42,    31,    32,    -1,    -1,    35,    36,    -1,    38,     3,
      40,    -1,    42,    -1,    -1,    -1,    -1,    11,    -1,    -1,
      14,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    66,    31,    32,    -1,
      -1,    35,    36,    -1,    38,    -1,    40,    -1,    42,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,    -1,   129,   130,   131,   132,   133,   134,    19,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    33,    34,    -1,   152,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    19,    -1,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      33,    34,    -1,    -1,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    -1,    -1,    49,    50,    51,    52,
      53,    54,    33,    -1,    -1,    -1,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    -1,    -1,    49,    50,
      51,    52,    53,    54,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    -1,    -1,    49,    50,    51,    52,
      53,    54,    37,    38,    -1,    40,    41,    42,    43,    44,
      45,    46,    -1,    -1,    49,    50,    51,    52,    53,    54,
      38,    -1,    40,    41,    42,    43,    44,    45,    46,    -1,
      -1,    49,    50,    51,    52,    53,    54,    40,    41,    42,
      43,    44,    45,    46,    -1,    -1,    49,    50,    51,    52,
      53,    54,    40,    41,    42,    43,    44,    45,    46,    -1,
      -1,    -1,    -1,    51,    52,    53,    54
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     5,     7,     8,     9,    10,    68,    69,     4,
       8,     9,    10,     4,     7,     8,     4,     7,     7,     0,
       3,    40,     4,     8,     4,     4,     4,     7,     4,    14,
       4,     4,     6,    69,    70,     3,    13,    15,    69,    16,
       3,    71,     3,    11,    12,    14,    16,    17,    31,    32,
      35,    36,    38,    40,    42,    55,    56,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    69,    72,    76,    77,
      78,    79,    80,    81,    14,    69,    81,    71,     3,    76,
      76,    76,    77,    77,    76,    76,    77,    81,    14,    14,
      72,    14,    12,    12,    79,    14,    47,    14,     3,    73,
      74,    75,    18,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    48,    49,
      50,    51,    52,    53,    54,    12,    13,    81,    15,    15,
      17,    12,    81,    81,    58,    81,    47,    81,    72,    69,
      12,    13,    18,    20,    78,    80,    80,    80,    80,    80,
      80,    80,    80,    80,    80,    80,    78,    78,    78,    78,
      78,    78,    78,    78,    78,    78,    78,    78,    79,    78,
      78,    78,    78,    78,    78,    80,    15,    77,    15,    15,
      14,    12,    72,    15,    15,    74,    75,    19,    78,    16,
      80,    82,    19,    47,    72,    72,    81,    81,    72,    19,
      80,    82,    83,    79,    57,    15,    12,    13,    17,    72,
      12,    81,    83,    15,    72
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    67,    68,    69,    69,    69,    69,    69,    69,    69,
      69,    69,    69,    69,    69,    69,    69,    69,    69,    69,
      69,    69,    69,    69,    69,    69,    69,    69,    69,    70,
      70,    70,    70,    71,    71,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    72,    72,    72,    72,    72,    72,
      73,    73,    73,    73,    74,    74,    74,    75,    75,    76,
      76,    77,    77,    77,    77,    77,    77,    77,    77,    77,
      77,    77,    77,    77,    77,    77,    78,    78,    78,    78,
      78,    78,    78,    78,    78,    78,    78,    78,    78,    78,
      78,    78,    78,    78,    78,    79,    79,    80,    80,    80,
      80,    80,    80,    80,    80,    80,    80,    80,    80,    81,
      81,    82,    82,    83,    83
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     8,     1,     2,     2,     3,     3,     3,     3,
       2,     2,     2,     2,     2,     3,     3,     4,     4,     2,
       1,     1,     1,     2,     1,     3,     2,     1,     2,     0,
       1,     2,     4,     0,     2,     3,     2,     1,     3,     2,
       2,     5,     7,     9,     7,     5,     3,     5,     4,     3,
       1,     1,     3,     3,     1,     4,     3,     3,     3,     1,
       4,     1,     1,     3,     4,     2,     2,     2,     4,     2,
       2,     2,     2,     2,     2,     4,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     5,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     1,     3,     1,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 407 "simplec.y" /* yacc.c:1646  */
    { return_type = (yyvsp[-7]); function_name = (yyvsp[-6])->name;
     function_body = flush_decls(new_node2(S_SEQUENCE, IOP_NONE, (yyvsp[-4]), flush_decls((yyvsp[-1])))); }
#line 1879 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 412 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(ISIZE, DATA_UNSIGNED, NULL); }
#line 1885 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 413 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_UNSIGNED, NULL); }
#line 1891 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 414 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_UNSIGNED, NULL); }
#line 1897 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 415 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_UNSIGNED, NULL); }
#line 1903 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 416 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_UNSIGNED, NULL); }
#line 1909 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 417 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_UNSIGNED, NULL); }
#line 1915 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 418 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_UNSIGNED, NULL); }
#line 1921 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 419 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_UNSIGNED, NULL); }
#line 1927 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 420 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_UNSIGNED, NULL); }
#line 1933 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 421 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(CSIZE, DATA_UNSIGNED, NULL); }
#line 1939 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 422 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(CSIZE, DATA_UNSIGNED, NULL); }
#line 1945 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 423 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(ISIZE, DATA_UNSIGNED, NULL); }
#line 1951 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 424 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_UNSIGNED, NULL); }
#line 1957 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 425 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_UNSIGNED, NULL); }
#line 1963 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 426 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_UNSIGNED, NULL); }
#line 1969 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 427 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_UNSIGNED, NULL); }
#line 1975 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 428 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_SIGNED, NULL); }
#line 1981 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 429 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(SSIZE, DATA_SIGNED, NULL); }
#line 1987 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 430 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(CSIZE, DATA_SIGNED, NULL); }
#line 1993 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 431 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(ISIZE, DATA_SIGNED, NULL); }
#line 1999 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 432 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_SIGNED, NULL); }
#line 2005 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 433 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LSIZE, DATA_SIGNED, NULL); }
#line 2011 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 434 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_SIGNED, NULL); }
#line 2017 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 435 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(LLSIZE, DATA_SIGNED, NULL); }
#line 2023 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 436 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node(FLOAT_SIZE, DATA_FLOAT, NULL); }
#line 2029 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 437 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_PTR, IOP_NONE, (yyvsp[-1])); }
#line 2035 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 440 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node0(S_NOP, IOP_NONE); }
#line 2041 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 441 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node0(S_NOP, IOP_NONE); }
#line 2047 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 442 "simplec.y" /* yacc.c:1646  */
    { (yyval)=declare_var((yyvsp[-1]), (yyvsp[0]), 0); }
#line 2053 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 443 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node((yyvsp[-3]), declare_var((yyvsp[-1]), (yyvsp[0]), 0)); }
#line 2059 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 446 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node0(S_NOP, IOP_NONE); }
#line 2065 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 447 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node((yyvsp[-1]), (yyvsp[0])); }
#line 2071 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 451 "simplec.y" /* yacc.c:1646  */
    { apply_type((yyvsp[-2]), (yyvsp[-1])); (yyval)=(yyvsp[-1]); }
#line 2077 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 452 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[-1]); }
#line 2083 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 453 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node0(S_NOP, IOP_NONE); }
#line 2089 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 454 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_RETURN, IOP_NONE, (yyvsp[-1])); }
#line 2095 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 455 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_BREAK, IOP_NONE, (yyvsp[0])); }
#line 2101 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 456 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_CONTINUE, IOP_NONE, (yyvsp[0])); }
#line 2107 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 457 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_CATCHB, IOP_NONE,
							    new_node2(S_WHILE, IOP_NONE, (yyvsp[-2]),
								      new_node1(S_CATCHC, IOP_NONE, (yyvsp[0])))); }
#line 2115 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 461 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_CATCHB, IOP_NONE,
				   sequence_node(new_node1(S_CATCHC, IOP_NONE, (yyvsp[-5])),
						 new_node2(S_WHILE, IOP_NONE, (yyvsp[-2]),
							   new_node1(S_CATCHC, IOP_NONE, (yyvsp[-5]))))); }
#line 2124 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 466 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node((yyvsp[-6]),
				       new_node1(S_CATCHB, IOP_NONE,
						 new_node2(S_WHILE, IOP_NONE, (yyvsp[-4]),
							   sequence_node(new_node1(S_CATCHC, IOP_NONE, (yyvsp[0])), (yyvsp[-2]))))); }
#line 2133 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 470 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node3(S_IFTHEN, IOP_NONE, (yyvsp[-4]), (yyvsp[-2]), (yyvsp[0])); }
#line 2139 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 471 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node3(S_IFTHEN, IOP_NONE, (yyvsp[-2]), (yyvsp[0]), new_node0(S_NOP, IOP_NONE)); }
#line 2145 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 472 "simplec.y" /* yacc.c:1646  */
    { (yyval)=flush_decls((yyvsp[-1])); }
#line 2151 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 474 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(S_CATCHB, IOP_NONE, new_node2(S_SWITCH, IOP_NONE, (yyvsp[-2]), (yyvsp[0]))); }
#line 2157 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 475 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node(new_node1(S_CASE, IOP_NONE, (yyvsp[-2])), (yyvsp[0])); }
#line 2163 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 476 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node(new_node0(S_CASE, IOP_NONE), (yyvsp[0])); }
#line 2169 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 480 "simplec.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2175 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 481 "simplec.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2181 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 482 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node((yyvsp[-2]), (yyvsp[0])); }
#line 2187 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 483 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sequence_node((yyvsp[-2]), (yyvsp[0])); }
#line 2193 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 487 "simplec.y" /* yacc.c:1646  */
    { (yyval) = declare_var(default_type, (yyvsp[0]), 1); }
#line 2199 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 488 "simplec.y" /* yacc.c:1646  */
    { add_array_dim((yyvsp[-3])->children[0], (yyvsp[-1])); (yyval) = (yyvsp[-3]); }
#line 2205 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 489 "simplec.y" /* yacc.c:1646  */
    { add_array_dim((yyvsp[-2])->children[0], make_ast_num("-1"));  (yyval) = (yyvsp[-2]); }
#line 2211 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 493 "simplec.y" /* yacc.c:1646  */
    { self_check((yyvsp[-2]), (yyvsp[0]));
  	                    (yyval) = sequence_node((yyvsp[-2]), new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2])->children[0], (yyvsp[0]))); }
#line 2218 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 495 "simplec.y" /* yacc.c:1646  */
    { self_check((yyvsp[-2]), (yyvsp[0]));
  	                    (yyval) = sequence_node((yyvsp[-2]), new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2])->children[0], (yyvsp[0]))); }
#line 2225 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 500 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[0])); (yyval)=(yyvsp[0]); }
#line 2231 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 501 "simplec.y" /* yacc.c:1646  */
    { (yyval)=add_array_ref((yyvsp[-3]), (yyvsp[-1])); }
#line 2237 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 505 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2243 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 506 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2249 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 507 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[-1]); }
#line 2255 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 508 "simplec.y" /* yacc.c:1646  */
    { (yyval)=cast_node((yyvsp[-2])->wsize, (yyvsp[-2])->dtype, (yyvsp[0])); }
#line 2261 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 509 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_ISZERO, (yyvsp[0])); }
#line 2267 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 510 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_NOT, (yyvsp[0])); }
#line 2273 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 511 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_NEG, (yyvsp[0])); }
#line 2279 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 512 "simplec.y" /* yacc.c:1646  */
    { (yyval)=sizeof_node((yyvsp[-1])); }
#line 2285 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 513 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-1])); (yyval)=new_node2(E_PASSIGN, IOP_NONE, (yyvsp[-1]), new_node2(E_BINOP, IOP_ADD, (yyvsp[-1]), make_ast_num("1"))); }
#line 2291 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 514 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-1])); (yyval)=new_node2(E_PASSIGN, IOP_NONE, (yyvsp[-1]), new_node2(E_BINOP, IOP_SUB, (yyvsp[-1]), make_ast_num("1"))); }
#line 2297 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 515 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[0])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[0]), new_node2(E_BINOP, IOP_SUB, (yyvsp[0]), make_ast_num("1"))); }
#line 2303 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 516 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[0])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[0]), new_node2(E_BINOP, IOP_ADD, (yyvsp[0]), make_ast_num("1"))); }
#line 2309 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 517 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[0])); (yyval)=new_node1(E_DEREF, IOP_NONE, (yyvsp[0])); }
#line 2315 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 518 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[0])); (yyval)=new_node1(E_PTR, IOP_NONE, (yyvsp[0])); }
#line 2321 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 519 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_FUNCALL, IOP_NONE, (yyvsp[-3]), (yyvsp[-1])); }
#line 2327 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 523 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2333 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 524 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_MUL, (yyvsp[-2]), (yyvsp[0])); }
#line 2339 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 525 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_ADD, (yyvsp[-2]), (yyvsp[0])); }
#line 2345 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 526 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_SUB, (yyvsp[-2]), (yyvsp[0])); }
#line 2351 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 527 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_DIV, (yyvsp[-2]), (yyvsp[0])); }
#line 2357 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 528 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_REM, (yyvsp[-2]), (yyvsp[0])); }
#line 2363 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 529 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_LSHIFT, (yyvsp[-2]), (yyvsp[0])); }
#line 2369 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 530 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_RSHIFT, (yyvsp[-2]), (yyvsp[0])); }
#line 2375 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 531 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_LESS, (yyvsp[-2]), (yyvsp[0])); }
#line 2381 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 532 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_LESSEQUAL, (yyvsp[-2]), (yyvsp[0])); }
#line 2387 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 533 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_LESS, (yyvsp[0]), (yyvsp[-2])); }
#line 2393 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 534 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_LESSEQUAL, (yyvsp[0]), (yyvsp[-2])); }
#line 2399 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 535 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_EQUAL, (yyvsp[-2]), (yyvsp[0])); }
#line 2405 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 536 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_ISZERO, new_node2(E_BINOP, IOP_EQUAL, (yyvsp[-2]), (yyvsp[0]))); }
#line 2411 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 537 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_AND, (yyvsp[-2]), (yyvsp[0])); }
#line 2417 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 538 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_BINOP, IOP_XOR, (yyvsp[-2]), (yyvsp[0])); }
#line 2423 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 539 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_NOT,
					     new_node2(E_BINOP, IOP_AND,
						       new_node1(E_UNOP, IOP_NOT, (yyvsp[-2])),
						       new_node1(E_UNOP, IOP_NOT, (yyvsp[0])))); }
#line 2432 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 543 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_CAND, IOP_NONE, (yyvsp[-2]), (yyvsp[0])); }
#line 2438 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 544 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node1(E_UNOP, IOP_ISZERO,
					     new_node2(E_CAND, IOP_NONE,
						       new_node1(E_UNOP, IOP_ISZERO, (yyvsp[-2])),
						       new_node1(E_UNOP, IOP_ISZERO, (yyvsp[0])))); }
#line 2447 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 551 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2453 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 552 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node3(E_QUESCOLON, IOP_NONE, (yyvsp[-4]), (yyvsp[-2]), (yyvsp[0])); }
#line 2459 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 556 "simplec.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2465 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 557 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]), (yyvsp[0])); }
#line 2471 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 558 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_XOR, (yyvsp[-2]), (yyvsp[0]))); }
#line 2478 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 560 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_AND, (yyvsp[-2]), (yyvsp[0]))); }
#line 2485 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 562 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_MUL, (yyvsp[-2]), (yyvsp[0]))); }
#line 2492 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 564 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_ADD, (yyvsp[-2]), (yyvsp[0]))); }
#line 2499 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 566 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_DIV, (yyvsp[-2]), (yyvsp[0]))); }
#line 2506 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 568 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_REM, (yyvsp[-2]), (yyvsp[0]))); }
#line 2513 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 570 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
			                      new_node2(E_BINOP, IOP_SUB, (yyvsp[-2]), (yyvsp[0]))); }
#line 2520 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 572 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node1(E_UNOP, IOP_NOT,
							new_node2(E_BINOP, IOP_AND,
								  new_node1(E_UNOP, IOP_NOT, (yyvsp[-2])),
								  new_node1(E_UNOP, IOP_NOT, (yyvsp[0]))))); }
#line 2530 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 577 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_LSHIFT, (yyvsp[-2]), (yyvsp[0]))); }
#line 2537 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 579 "simplec.y" /* yacc.c:1646  */
    { check_ast_var((yyvsp[-2])); (yyval)=new_node2(E_ASSIGN, IOP_NONE, (yyvsp[-2]),
					      new_node2(E_BINOP, IOP_RSHIFT, (yyvsp[-2]), (yyvsp[0]))); }
#line 2544 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 585 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2550 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 586 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_SEQUENCE, IOP_NONE, (yyvsp[-2]), (yyvsp[0])); }
#line 2556 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 591 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[0]); }
#line 2562 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 592 "simplec.y" /* yacc.c:1646  */
    { (yyval)=(yyvsp[-1]); }
#line 2568 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 596 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_SEQUENCE, IOP_NONE, (yyvsp[0]), NULL); }
#line 2574 "simplec.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 597 "simplec.y" /* yacc.c:1646  */
    { (yyval)=new_node2(E_SEQUENCE, IOP_NONE, (yyvsp[-2]), (yyvsp[0])); }
#line 2580 "simplec.tab.c" /* yacc.c:1646  */
    break;


#line 2584 "simplec.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
