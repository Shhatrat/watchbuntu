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
			case 2: return "[BATT]";	
			case 3: return "[STEP]";	
			case 4: return "[HR_L]";	
			case 5: return "[TEMP]";	
		}		
	}

	function getTime(){
	        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
		return timeString;
	}
}