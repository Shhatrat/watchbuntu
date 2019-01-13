using Toybox.System;

class DataProvider{


	function getTitleOfData(position){
		var type = Application.getApp().getProperty("Data"+position+"Type");
		switch(type){
			case 0: return "[TIME]";
			case 1: return "[DATE]";	
			case 2: return "[BATT]";	
			case 3: return "[STEP]";	
			case 4: return "[HR_L]";	
			case 5: return "[TEMP]";	
		}
	}
	
	function getData(position){
		var type = Application.getApp().getProperty("Data"+position+"Type");
		switch(type){
			case 0: return getTime();
			case 1: return "[DATE]";	
			case 2: return getBattery();	
			case 3: return "[STEP]";	
			case 4: return "[HR_L]";	
			case 5: return "[TEMP]";	
		}		
	}
	
	function getBattery(){
		var stats = System.getSystemStats().battery;
		var outStr = "[";
		if(stats<20){
			outStr = outStr+ "#........";
		}
		if(stats>=20 && stats<40){
			outStr = outStr+ "##......";
		}
		if(stats>=40 && stats<60){
			outStr = outStr+ "###....";
		}
		if(stats>=60 && stats<80){
			outStr = outStr+ "####..";
		}
		if(stats>=80){
			outStr = outStr+ "#####";
		}
		outStr = outStr +"] ";
		outStr = outStr +stats.toNumber()+"%";
		return outStr;
	}

	function getTime(){
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        var timeString="";
        if(Application.getApp().getProperty("ShowSeconds")){
			timeString= hours+":"+clockTime.min.format("%02d")+":"+clockTime.sec.format("%02d");
        }else{
			timeString= hours+":"+clockTime.min.format("%02d");
        }
		return timeString;
	}
}