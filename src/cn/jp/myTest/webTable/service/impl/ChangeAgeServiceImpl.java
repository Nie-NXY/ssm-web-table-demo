package cn.jp.myTest.webTable.service.impl;

import org.springframework.stereotype.Service;
import cn.jp.myTest.webTable.service.ChangeAgeService;

@Service
public class ChangeAgeServiceImpl implements ChangeAgeService{

    private static final String[] chineseNumbers = {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"};

    @Override
    public String changeAge(String age){
        // 非空判断
        if(age == null){
            return "请输入年龄";
        }
        age = age.trim();
        if(age.isEmpty()){
            return "请输入年龄";
        }

        Integer ageInt;
        try{
            ageInt = Integer.valueOf(age);
        }catch (NumberFormatException e){
            return "请输入数字";
        }

        // 范围校验 1~150
        if(ageInt <= 0 || ageInt > 150){
            return "年龄范围是 1~150";
        }

        Integer geIndex = ageInt % 10;
        Integer shiIndex = (ageInt / 10) % 10;
        Integer baiIndex = (ageInt / 100) % 10;
        String ageCN ="";

        // 百位
        if(baiIndex > 0){
        	ageCN += chineseNumbers[baiIndex] +"百";
        }

        // 十位
        if(shiIndex == 0){
            // 百位存在 && 个位不为0
            if(baiIndex != 0 && geIndex != 0){
            	ageCN += chineseNumbers[shiIndex];
            }
        }else if (shiIndex == 1 && baiIndex == 0){
            // 10~19，没有百位：十、十五
        	ageCN += "十";
        }else{
        	ageCN += chineseNumbers[shiIndex] + "十";
        }

        // 个位：个位不等于0才追加
        if(geIndex != 0){
        	ageCN += chineseNumbers[geIndex];
        }
        ageCN += "岁";
        System.out.println("后台转换年龄结果：" + ageCN);
        return ageCN;
    }
}
