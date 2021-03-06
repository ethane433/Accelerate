/*
	The MIT License

	Copyright (c) 2010 Mike Chambers

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
*/

import controls.LEDControl;

public static const DISCONNECTED:String = "Disconnected";
public static const CONNECTED:String = "Connected";
public static const ACTIVE:String = "Active";
public static const TRIPPED:String = "Tripped";
public static const RESETTING:String = "Resetting";

private var _label:String;
private var _value:String;
private var _status:String;

import mx.logging.Log;

private function onCreationComplete():void
{
	if(!_status)
	{
		this.status = DISCONNECTED;
	}
}

public function set status(value:String):void
{
	switch(value)
	{
		case (DISCONNECTED):
		{
			led.ledColor = LEDControl.RED;
			break;
		}
		case (CONNECTED):
		{
			led.ledColor = LEDControl.GREEN;
			break;
		}
		case (ACTIVE):
		{
			led.ledColor = LEDControl.GREEN;
			break;
		}
		case (TRIPPED):
		{
			led.ledColor = LEDControl.GREEN;
			break;
		}
		case (RESETTING):
		{
			//todo: maybe make this yellow?
			//led.ledColor = LEDControl.GREEN;
			break;
		}
		default:
		{
			Log.getLogger("LOG").error("SensorStatusControl.status : status not recognized : " + value);
			return;
		}
	}
	
	_status = value;
	statusField.text = _status;
}

public function set label(value:String):void
{
	_label = value;
	labelField.text = _label;
}

public function get label():String
{
	return _label;
}

public function set value(value:String):void
{
	_value = value;
	valueField.text = _value;
}

public function get value():String
{
	return _value;
}