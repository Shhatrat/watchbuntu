using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Graphics as Gfx;
class watchbuntuView extends WatchUi.WatchFace {

	var dataProvider;

    function initialize() {
        WatchFace.initialize();
        dataProvider = new $.DataProvider();
    }

    // Load your resources here
    function onLayout(dc) {
//        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {

        View.onUpdate(dc);

		var startPosition = Application.getApp().getProperty("startPosition");
		var startTerminal = Application.getApp().getProperty("startTerminal");
		var startData = Application.getApp().getProperty("startData");
		
		var terminalColorTitle = Application.getApp().getProperty("TerminalColorTitle");
		var dataTitleColor = Application.getApp().getProperty("DataTitleColor");

	//	background
        dc.setColor(Application.getApp().getProperty("BackgroundColor"), Application.getApp().getProperty("BackgroundColor"));
		dc.clear();
		
	//terminal 	
		dc.setColor(terminalColorTitle, Gfx.COLOR_TRANSPARENT);	
		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.15, Gfx.FONT_TINY, "user@watch", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.75, Gfx.FONT_TINY, "user@watch", Gfx.TEXT_JUSTIFY_LEFT);
		
		dc.setColor(dataTitleColor, Gfx.COLOR_TRANSPARENT);			
		dc.drawText(dc.getWidth()* startTerminal, dc.getHeight()* 0.15, Gfx.FONT_TINY, ":~$ now", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* startTerminal, dc.getHeight()* 0.75, Gfx.FONT_TINY, ":~$", Gfx.TEXT_JUSTIFY_LEFT);
				
	//data
		
		var position = 0.25;

		dc.setColor(dataTitleColor, Gfx.COLOR_TRANSPARENT);					
		for (var i = 1 ; i< 6; i+=1){
			var title = dataProvider.getTitleOfData(i);
			dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* position, Gfx.FONT_TINY, title, Gfx.TEXT_JUSTIFY_LEFT);
			position = position + 0.10;
		}
		
		position = 0.25;
		for (var i = 1 ; i< 6; i+=1){
			dc.setColor(Application.getApp().getProperty("Data"+i+"Color"), Gfx.COLOR_TRANSPARENT);					
			var data = dataProvider.getData(i);
			dc.drawText(dc.getWidth()* startData, dc.getHeight()* position, Gfx.FONT_TINY, data, Gfx.TEXT_JUSTIFY_LEFT);
			position = position + 0.10;
		}
		
//		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.25, Gfx.FONT_TINY, "[TIME] 2:15:55 PM", Gfx.TEXT_JUSTIFY_LEFT);
//		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.35, Gfx.FONT_TINY, "[DATE] 11/12/2001", Gfx.TEXT_JUSTIFY_LEFT);
//		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.45, Gfx.FONT_TINY, "[BATT] [####..] 81%", Gfx.TEXT_JUSTIFY_LEFT);
//		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.55, Gfx.FONT_TINY, "[STEP] 823 steps", Gfx.TEXT_JUSTIFY_LEFT);
//		dc.drawText(dc.getWidth()* startPosition, dc.getHeight()* 0.65, Gfx.FONT_TINY, "[L_HR] 74 bpm", Gfx.TEXT_JUSTIFY_LEFT);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
