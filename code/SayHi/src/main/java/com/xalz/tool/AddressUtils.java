package com.xalz.tool;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

/**
 * Created by zhenghao on 2016/6/24.
 * 当前位置处理工具
 */
public class AddressUtils {

    /**
     * 获取指定IP对应的经纬度（为空返回当前机器经纬度）
     * @return
     */
    public static String[] getIPXY() {

        //获取本机公网ip
        String ip = getPublicWebIP();

        if(ip==null || ip.trim().equals("")) return null;

        //百度map ak
        String ak = "NT3IUCXlbwjmChavu9edbhVtajyVcKnI";

        try {

            URL url = new URL("http://api.map.baidu.com/location/ip?ak=" + ak + "&ip=" + ip + "&coor=bd09ll");
            InputStream inputStream = url.openStream();
            InputStreamReader inputReader = new InputStreamReader(inputStream);
            BufferedReader reader = new BufferedReader(inputReader);
            StringBuilder sb = new StringBuilder();
            String str;

            do {
                str = reader.readLine();
                sb.append(str);
            } while (null != str);


            str = sb.toString();

            if (str.isEmpty()) {
                return null;
            }


            // 获取坐标位置
            int index = str.indexOf("point");
            int end = str.indexOf("}}", index);


            if (index == -1 || end == -1) {
                return null;
            }


            str = str.substring(index - 1, end + 1);
            if (str.isEmpty()) {
                return null;
            }


            String[] ss = str.split(":");
            if (ss.length != 4) {
                return null;
            }


            String x = ss[2].split(",")[0];
            String y = ss[3];


            x = x.substring(x.indexOf("\"") + 1, x.indexOf("\"", 1));
            y = y.substring(y.indexOf("\"") + 1, y.indexOf("\"", 1));


            return new String[] { x, y };


        } catch (IOException e) {
            e.printStackTrace();
        }


        return null;
    }

    public static String getPublicWebIP() {

        String http_url ="http://www.ip.cn/";

        try{

            URL url = new URL(http_url);
            InputStream inputStream = url.openStream();
            InputStreamReader inputReader = new InputStreamReader(inputStream);
            BufferedReader reader = new BufferedReader(inputReader);
            StringBuilder sb = new StringBuilder();
            String str;

            do {
                str = reader.readLine();
                sb.append(str);
            } while (null != str);


            str = sb.toString();

            if (str.isEmpty()) {
                return null;
            }


            //从内容中截取代码 <code>117.184.120.234</code>

            int start = str.indexOf("<code>") + "<code>".length();

            int end = str.indexOf("</code>");

            str = str.substring(start,end);

            return str;


        }catch (Exception e){

            e.printStackTrace();
        }

        return null;
    }


    public static void main(String[] args) {

        String [] location = AddressUtils.getIPXY();

        assert location != null;

        String widu=location[1];
        String jndu=location[0];

        System.out.println(widu);

        System.out.println(jndu);

    }

}