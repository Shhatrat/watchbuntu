using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Graphics as Gfx;
class watchbuntuView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
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
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (Application.getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
//        var view = View.findDrawableById("TimeLabel");
//        view.setColor(Application.getApp().getProperty("ForegroundColor"));
//        view.setText(timeString);
        View.onUpdate(dc);
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
		dc.clear();
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.15, Gfx.FONT_TINY, "user@watch", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.58, dc.getHeight()* 0.15, Gfx.FONT_TINY, ":~$ now", Gfx.TEXT_JUSTIFY_LEFT);
				

		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.25, Gfx.FONT_TINY, "[TIME] 2:15:55 PM", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.35, Gfx.FONT_TINY, "[DATE] 11/12/2001", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.45, Gfx.FONT_TINY, "[BATT] [####..] 81%", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.55, Gfx.FONT_TINY, "[STEP] 823 steps", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.65, Gfx.FONT_TINY, "[L_HR] 74 bpm", Gfx.TEXT_JUSTIFY_LEFT);
		dc.drawText(dc.getWidth()* 0.2, dc.getHeight()* 0.75, Gfx.FONT_TINY, "user@watch:~$", Gfx.TEXT_JUSTIFY_LEFT);


        // Call the parent onUpdate function to redraw the layout

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
