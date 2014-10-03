WEBOTS_NXT_bumper theInfo= touch_data_ptr.get();
doorOpen= !(theInfo.get_object(RIGHT_TOUCH_SENSOR)).secondParameter();
