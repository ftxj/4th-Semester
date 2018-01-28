# -*- coding: utf-8 -*-
import top.api
import datetime
import yaml
import urllib2

def dealConfig(inputJsonFile):
    with open(inputJsonFile, 'r') as json_file:
        Jconfig = yaml.safe_load(json_file)
    appkey = Jconfig.get('appkey')
    secret = Jconfig.get('secret')
    citys = dict(
        first=[Jconfig.get('citys').get('0').get('id'),Jconfig.get('citys').get('0').get('zh-nam'),
            Jconfig.get('citys').get('0').get('who')],
        second=[Jconfig.get('citys').get('1').get('id'),Jconfig.get('citys').get('1').get('zh-nam'),
            Jconfig.get('citys').get('1').get('who')],
        third=[Jconfig.get('citys').get('2').get('id'),Jconfig.get('citys').get('2').get('zh-nam'),
            Jconfig.get('citys').get('2').get('who')],
        fourth=[Jconfig.get('citys').get('3').get('id'),Jconfig.get('citys').get('3').get('zh-nam'),
            Jconfig.get('citys').get('3').get('who')]
    )
    return appkey,secret,citys

def sendMsg(param, phone, appkey, secret):
    req = top.api.AlibabaAliqinFcSmsNumSendRequest()
    req.set_app_info(top.appinfo(appkey, secret))
 
    req.extend = ""
    req.sms_type = "normal"
    req.sms_free_sign_name = "辛杰"
    req.sms_param = "{where:'" + param + "'}"
    req.rec_num = phone
    req.sms_template_code = "SMS_63850383"

    try :
        resp = req.getResponse()
        f=open('Msg_info.txt','a+')
        num  = '"to : ' + phone + '"\n'
        f.write(str(resp))
        f.write(num)
        f.close()
    except Exception,e:
        print (e)


def time_converter(time):
    converted_time = datetime.datetime.fromtimestamp(
        int(time)
    ).strftime('%I:%M %p')
    return converted_time


def url_builder(city_id):
    user_api = 'b3ab4e2b0cffa2d36dd99280aaefe9c5' 
    unit = 'metric'  
    api = 'http://api.openweathermap.org/data/2.5/weather?id='

    full_api_url = api + str(city_id) + '&mode=json&units=' + unit + '&APPID=' + user_api
    return full_api_url


def data_fetch(full_api_url):
    url = urllib2.urlopen(full_api_url)
    output = url.read().decode('utf-8')
    raw_api_dict = yaml.safe_load(output)
    return raw_api_dict


def data_organizer(raw_api_dict):
    data = dict(
        city=raw_api_dict.get('name'),
        country=raw_api_dict.get('sys').get('country'),
        temp=raw_api_dict.get('main').get('temp'),
        temp_max=raw_api_dict.get('main').get('temp_max'),
        temp_min=raw_api_dict.get('main').get('temp_min'),
        sky=raw_api_dict['weather'][0]['main'],
        sky_full=raw_api_dict['weather'][0]['description'],
        wind=raw_api_dict.get('wind').get('speed'),
        wind_deg=raw_api_dict.get('deg'),
        dt=time_converter(raw_api_dict.get('dt'))
    )
    return data


def data_output(data):
    m_symbol = '\xb0' + 'C'
    print('---------------------------------------')
    print('Current weather in: {}, {}:'.format(data['city'], data['country']))
    print(data['temp'], m_symbol, data['sky'] , data['sky_full'])
    print('Max: {}, Min: {}'.format(data['temp_max'], data['temp_min']))
    print('')
    print('Wind Speed: {}, Degree: {}'.format(data['wind'], data['wind_deg']))
    print('')
    print('Last update from the server: {}'.format(data['dt']))
    print('---------------------------------------')

def ifRain(raw_api_dict):
    Sky = raw_api_dict['weather'][0]['main']
    if Sky == "Rain":
        return 1
    return 0

if __name__ == '__main__':
    appkey, secret, citys=dealConfig("./autoWeather.json")
    try:
        for id in citys:
            if ifRain(data_fetch(url_builder(int(citys[id][0])))) == 1:  
                sendMsg(citys[id][1].encode('utf-8'), citys[id][2],appkey,secret)
    except IOError:
        print('no internet')