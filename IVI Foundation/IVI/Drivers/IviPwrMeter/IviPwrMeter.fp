s��   	     �Y   Q v�  .�   �   ����                                IviPwrMeter                     IviPwrMeter Class Driver                                                                              � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr     � ��ViAddr   K    This class driver contains programming support for the IviPwrMeter class.        This class contains functions and sub-classes that configure the DMM.  The class includes high-level functions that configure the basic measurement operation and subclasses that configure the trigger and the multi-point measurement capability.  It also contains sub-classes that configure additional parameters for some measurement types and that return information about the current state of the instrument. The class also contains the low-level functions that set, get, and check individual attribute values.
     e    This class contains a function that can specify a trigger source on which to trigger a measurement.     ;    This class contains functions to perform the calibration.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that determine if you can set an attribute to a particular value.  There are typesafe functions for each attribute data type.     ?    This class contains functions to perform the zero correction.     ;    This class contains functions to perform the calibration.    �    This class contains functions and sub-classes that initiate and retrieve measurements using the current configuration.  The class contains high-level read functions that initiate a measurement and fetch the data in one operation.  The class also contains low-level functions that initiate the measurement process, send a software trigger, and fetch measurement values in separate operations.
        The class contains functions that give low-level control over how the Power Meter takes measurements.  The functions perform the following operations:

- initiate the measurement process,
- send a software trigger, 
- fetch measurement values, and 
- abort the measurement process.  

    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    K    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviPwrMeter_LockSession and IviPwrMeter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SamplePwrMeter"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviPwrMeter_LockSession and IviPwrMeter_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    h =   �  �    Logical Name                      9 : �       ID Query                          D =� �       Reset Device                      � �C �  �    Instrument Handle                 �#����  �    Status                             "SamplePwrMeter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          K    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviPwrMeter_LockSession and IviPwrMeter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SamplePwrMeter"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports.  

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument.  When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it.  This is useful if you have multiple physical instances of the same type of instrument.  

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviPwrMeter_LockSession and IviPwrMeter_UnlockSession to protect sections of code that require exclusive access to the resource.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIPWRMETER_ATTR_RANGE_CHECK
QueryInstrStatus  IVIPWRMETER_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIPWRMETER_ATTR_CACHE   
Simulate          IVIPWRMETER_ATTR_SIMULATE  
RecordCoercions   IVIPWRMETER_ATTR_RECORD_COERCIONS
InterchangeCheck  IVIPWRMETER_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    +� =   �  �    Logical Name                      /q : �       ID Query                          1| =� �       Reset Device                      26 �Y �  �    Instrument Handle                 4�#����  �    Status                            < �  � �    Option String                      "SamplePwrMeter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    Y    This function configures the unit to which the RF power is converted after measurement.    M    Specifies the units at the input terminals of the power meter. The driver sets the IVIPWRMETER_ATTR_UNITS attribute to this value.

Defined Values:
    IVIPWRMETER_VAL_DBM  (dBm )
    IVIPWRMETER_VAL_DBMV (dBmV)
    IVIPWRMETER_VAL_DBUV (dBuV)
    IVIPWRMETER_VAL_WATTS (Watts)


Default Value: 
    IVIPWRMETER_VAL_WATTS (Watts)

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    D0 = � � �    Measurement Units                 E�-   �  �    Instrument Handle                 FE#����  �    Status                                       hdBm IVIPWRMETER_VAL_DBM dBmV IVIPWRMETER_VAL_DBMV dBuV IVIPWRMETER_VAL_DBUV Watts IVIPWRMETER_VAL_WATTS        	              This function configures the instrument to take single or dual channel measurements.

For single channel measurements, this function enables the channel specified by Operand1 and disables all other channels. The result returned by the Fetch or Read functions is the measurement taken at the channel specified by the Operand1 parameter.  Although, the driver measures the power in Watts, the result is converted to the same unit the IVIPWRMETER_ATTR_UNITS attribute.

For dual channel measurements, this function enables the channels specified by the Operand1 and Operand2 parameters and disables all other channels. The result returned by the Fetch or Read functions is the result of the specified math operation applied to the measurements on the channels specified by Operand1 and Operand2.

Although, the math operation is performed on the measured values in Watts, the result is converted to the appropriate units depending on the value of the IVIPWRMETER_ATTR_UNITS attribute and the value of the Operator.  

For Difference and Sum operations, the resulting units is the same as the IVIPWRMETER_ATTR_UNITS attribute.

For Quotient operations, the resulting units are in dB, except when IVIPWRMETER_ATTR_UNITS attribute is set to Watts.  When set to Watts, the resulting measurement is without units.
     z    The name of the channel from which the value for the first operand of the math operator is measured.

Default Value: ""
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     {    The name of the channel from which the value for the second operand of the math operator is measured.

Default Value: ""
    �    The math function applied to the operands.

To configure the power meter to take single channel measurements, pass None as the Operator value. To configure the power meter to take simultaneous dual channel measurements, pass one of the other defined math operators as the Operator value.

Valid Values:

    IVIPWRMETER_VAL_NONE (No Operator) - Take a single channel
         measurement.  Return the measured value for Operand1.
         Operand2 is ignored.                                                           

    IVIPWRMETER_VAL_DIFFERENCE (Difference) - Subtract the 
        power measured on Operand2 from the power measured 
        on Operand1.

    IVIPWRMETER_VAL_SUM (Sum) - Add the power measured on 
        Operand2 to the power measured on Operand1.

    IVIPWRMETER_VAL_QUOTIENT (Quotient) - Divide the power
        measured on Operand1 by the power measured on 
        Operand2.

Default Value:
    IVIPWRMETER_VAL_DIFFERENCE (Difference)
    S� = � �  �    Operand 1                         T1-   �  �    Instrument Handle                 T�#����  �    Status                            \ =� �  �    Operand 2                         \� =  � �    Operator                           ""        	           ""              �No Operator IVIPWRMETER_VAL_NONE Difference IVIPWRMETER_VAL_DIFFERENCE Sum IVIPWRMETER_VAL_SUM Quotient IVIPWRMETER_VAL_QUOTIENT    L    This function enables or disables the auto range mode for a given channel.        The name of the channel to configure.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
         Specifies the auto range mode.  Pass VI_TRUE to turn auto ranging on.  Pass VI_FALSE to turn auto ranging off. The driver sets the IVIPWRMETER_ATTR_RANGE_AUTO_ENABLED attribute to this value.

Valid Values: 
    VI_TRUE  - "On"
    VI_FALSE - "Off"

Default Value:  
    VI_TRUE - "On"      �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    bm =  �  �    Channel Name                      fx = �  �    Range Auto Enabled                g�-   �  �    Instrument Handle                 h`#����  �    Status                             ""   On VI_TRUE Off VI_FALSE        	           P    This function enables or disables the auto-averaging mode for a given channel.        The name of the channel to be configured.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility in MAX. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    "    The auto-averaging mode.  Pass VI_TRUE to turn auto-averaging on.  Pass VI_FALSE to turn auto-averaging off.  The driver sets the IVIPWRMETER_ATTR_AVERAGING_AUTO_ENABLED attribute to this value. 

Valid Values: 
    VI_TRUE - "On"
    VI_FALSE - "Off"

Default Value: 
    VI_TRUE - "On"
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    p� =  �  �    Channel Name                      t� = �       Auto Averaging Enabled            v-   �  �    Instrument Handle                 v�#����  �    Status                             ""   On VI_TRUE Off VI_FALSE        	           �     This function specifies the frequency of the input signal in Hertz. The instrument uses this value to determine the appropriate correction factor for the sensor.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The name of the channel to be configured.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
        Specifies the expected frequency of the input signal in Hertz.  The instrument uses this parameter to determine the appropriate correction factor for the sensor.  The driver sets the IVIPWRMETER_ATTR_CORRECTION_FREQUENCY attribute to this value.

Units:   Hz

Default Value:  50 MHz    �-   �  �    Instrument Handle                 �n#����  �    Status                            �� =  �  �    Channel Name                      �� = � �  �    Frequency                              	           ""    50E6    V    This function specifies the offset to be added to the measured value in units of dB.    �    Specifies an offset to be added to the measured value.  The units of this attribute are dB.  This attribute can be used to compensate for system losses or gains between the unit under test and the sensor of the power meter. The driver sets the IVIPWRMETER_ATTR_OFFSET attribute to this value.

For example, a cable loss of 2 dB could be compensated for by setting this attribute to 2.  Similarly, a gain stage of 10 dB could be accounted for by setting the value of this attribute to -10.  In both cases, the reading from the power meter will indicate the power at the unit under test rather than power at the power meter's sensor.

Unit:    dB

Default Value:  0.0 dB     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The name of the channel for which to set the Offset.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    � = � �  �    Offset                            ��-   �  �    Instrument Handle                 �w#����  �    Status                            �� =  �  �    Channel Name                       0.0        	           ""    L    This function configures lower and upper range values for a given channel.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    Specify the upper limit of the expected value of the measurement.  The driver sets the IVIPWRMETER_ATTR_RANGE_UPPER
attribute to this value.

Unit:  Watt

Default Value:  0.01 (W)
     �    Specify the lower limit of the expected value of the measurement.  The driver sets the IVIPWRMETER_ATTR_RANGE_LOWER
attribute to this value.

Unit:  Watt

Default Value:  1.0e-6 (W)

        The name of the channel to configure.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� =� �  �    Range Upper                       �� = � �  �    Range Lower                       �U =  �  �    Channel Name                           	           0.01    1.0e-6    ""    �    This function sets the average count that the instrument uses in manual averaging mode. The averaging count specifies the number of samples that the instrument takes before the measurement is complete.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The name of the channel to configure.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Specifies the averaging count. The driver sets the IVIPWRMETER_ATTR_AVERAGING_COUNT attribute to this value.  

Default Value:  5    �e-   �  �    Instrument Handle                 �%#����  �    Status                            �E =  �  �    Channel Name                      �P = � �  �    Averaging Count                        	           ""    5    ~    This function enables or disables the duty cycle correction and sets the duty cycle correction for pulse power measurements.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    %    The name of the channel for which to specify the duty cycle correction.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Enables or disables the duty cycle correction. The driver sets the IVIPWRMETER_ATTR_DUTY_CYCLE_CORRECTION_ENABLED attribute to this value.

Valid Values: 
    VI_TRUE  - "On"  
    VI_FALSE - "Off"

Default Value:  
    VI_FALSE - "Off"
    3    Specifies the duty cycle correction the power meter uses to calculate the pulse power of a pulse-modulated signal. The driver sets the IVIPWRMETER_ATTR_DUTY_CYCLE_CORRECTION attribute to this value. 

The power meter measures the average power of the pulsed input signal and then divides the result by the duty cycle correction value to obtain a pulse power reading. 

The value of this attribute is specified as a percentage.
For a pulse with a duty cycle of 10%, this attribute should be given the value 0.1. 

Units:  percentage ( % ).

Default Value:  100 %    �P-   �  �    Instrument Handle                 �#����  �    Status                            �0 =  �  �    Channel Name                      �] 9 �       Correction Enabled                �T =� �  �    Correction Value                       	           ""    On VI_TRUE Off VI_FALSE    100   2    This function returns the physical channel identifier that corresponds to the one-based index specified by the ChannelIndex parameter. 

Notes:

(1) If you pass in a value for the ChannelIndex parameter that is less than one or greater than the value of the Channel Count attribute, the function returns an empty string in the ChannelName parameter and returns an error. 

(2) By passing 0 for the buffer size, you can ascertain the buffer size required to get the entire channel name string and then call the function again with a sufficiently large buffer.

     e    A 1-based index into the channel table.

Valid Range:   1 to number of channels.

Default Value: 1
        Returns the highest-level channel name that corresponds to the specific driver channel string that is in the channel table at an index you specify..

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the channel name description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  None     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �
 = 0 �  �    Index                             �w �6 �  �    Channel Name                      х � 1 �  �    Buffer Size                       �b-   �  �    Instrument Handle                 �"#����  �    Status                             1    	                    	           H    This function enables or disables a specified channel for measurement.    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Pass VI_TRUE to enable the channel. Pass VI_FALSE to disable the channel.  The driver sets the IVIPWRMETER_ATTR_CHANNEL_ENABLED
attribute to this value.  

Valid Values: 
    VI_TRUE  - "On"  
    VI_FALSE - "Off"

Default Value:  
    VI_TRUE - "On"
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �~ =  �  �    Channel Name                      �a = �  �    Channel Enabled                   �f-   �  �    Instrument Handle                 �&#����  �    Status                             ""   On VI_TRUE Off VI_FALSE        	           A    This function configures the trigger source of the power meter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Specifies the trigger source.  After you call either the IviPwrMeter_Read or the IviPwrMeter_Initiate function, the Power Meter waits for the trigger you specify. The driver sets the IVIPWRMETER_ATTR_TRIGGER_SOURCE attribute to this value.

Defined Values:
    
    IVIPWRMETER_VAL_IMMEDIATE (Immediate) - The power meter 
        exits the Wait-For-Trigger state immediately after
        entering.  It does not wait for a trigger of any kind.

    IVIPWRMETER_VAL_EXTERNAL (External) - The power meter
        exits the Wait-For-Trigger state when an internal
        trigger event occurs on the measurement signal.

    IVIPWRMETER_VAL_INTERNAL (Internal) - The power meter
        exits the Wait-For-Trigger state when a trigger
        occurs on the external trigger input.

    IVIPWRMETER_VAL_SOFTWARE_TRIG (Software) - The power 
        meter exits the Wait-For-Trigger state when it 
        receives software trigger.

    IVIPWRMETER_VAL_TTL0 (TTL0) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL0. 

    IVIPWRMETER_VAL_TTL1 (TTL1) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL1. 

    IVIPWRMETER_VAL_TTL2 (TTL2) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL2. 

    IVIPWRMETER_VAL_TTL3 (TTL3) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL3. 

    IVIPWRMETER_VAL_TTL4 (TTL4) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL4. 

    IVIPWRMETER_VAL_TTL5 (TTL5) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL5. 

    IVIPWRMETER_VAL_TTL6 (TTL6) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL6. 

    IVIPWRMETER_VAL_TTL7 (TTL7) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on TTL7. 

    IVIPWRMETER_VAL_ECL0 (ECL0) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on ECL0. 

    IVIPWRMETER_VAL_ECL1 (ECL1) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on ECL1. 

    IVIPWRMETER_VAL_PXI_STAR (PXI Star) - The power meter
        exits the Wait-For-Trigger state when it receives
        a trigger on PXI Star trigger bus. 

    IVIPWRMETER_VAL_RTSI_0 (RTSI0) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI0 line. 

    IVIPWRMETER_VAL_RTSI_1 (RTSI1) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI1 line. 

    IVIPWRMETER_VAL_RTSI_2 (RTSI2) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI2 line. 

    IVIPWRMETER_VAL_RTSI_3 (RTSI3) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI3 line. 

    IVIPWRMETER_VAL_RTSI_4 (RTSI4) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI4 line. 

    IVIPWRMETER_VAL_RTSI_5 (RTSI5) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI5 line. 

    IVIPWRMETER_VAL_RTSI_6 (RTSI6) - The power meter exits 
        the Wait-For-Trigger state when it receives a 
        trigger on RTSI6 line. 

Default Value: 
    IVIPWRMETER_VAL_IMMEDIATE (Immediate)
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �-   �  �    Instrument Handle                 �T = � � �    Trigger Source                    �U#����  �    Status                                           �Immediate IVIPWRMETER_VAL_IMMEDIATE External IVIPWRMETER_VAL_EXTERNAL Internal IVIPWRMETER_VAL_INTERNAL Software IVIPWRMETER_VAL_SOFTWARE_TRIG TTL0 IVIPWRMETER_VAL_TTL0 TTL1 IVIPWRMETER_VAL_TTL1 TTL2 IVIPWRMETER_VAL_TTL2 TTL3 IVIPWRMETER_VAL_TTL3 TTL4 IVIPWRMETER_VAL_TTL4 TTL5 IVIPWRMETER_VAL_TTL5 TTL6 IVIPWRMETER_VAL_TTL6 TTL7 IVIPWRMETER_VAL_TTL7 ECL0 IVIPWRMETER_VAL_ECL0 ECL1 IVIPWRMETER_VAL_ECL1 PXI Star IVIPWRMETER_VAL_PXI_STAR RTSI0 IVIPWRMETER_VAL_RTSI_0 RTSI1 IVIPWRMETER_VAL_RTSI_1 RTSI2 IVIPWRMETER_VAL_RTSI_2 RTSI3 IVIPWRMETER_VAL_RTSI_3 RTSI4 IVIPWRMETER_VAL_RTSI_4 RTSI5 IVIPWRMETER_VAL_RTSI_5 RTSI6 IVIPWRMETER_VAL_RTSI_6    	           o    This function configures the internal trigger event source and the internal trigger slope of the power meter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    ~    The name of the channel to use as the internal trigger event source. The driver sets the IVIPWRMETER_ATTR_INTERNAL_TRIGGER_EVENT_SOURCE attribute to this value.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    The internal trigger slope.  The driver sets the IVIPWRMETER_ATTR_INTERNAL_TRIGGER_SLOPE attribute to this value.

Valid Values:

    IVIPWRMETER_VAL_POSITIVE - Sets the trigger event 
        to occur on the rising edge of the trigger pulse.                                                               

    IVIPWRMETER_VAL_NEGATIVE (Difference) - Sets the 
        trigger event to occur on the falling edge of 
        the trigger pulse.

Default Value:

    IVIPWRMETER_VAL_POSITIVE
   *-   �  �    Instrument Handle                �#����  �    Status                           
 =  �  �    Event Source                     � = � � �    Slope                                  	           ""               DPositive IVIPWRMETER_VAL_POSITIVE Negative IVIPWRMETER_VAL_NEGATIVE    I    This function configures the internal trigger level of the power meter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    =    The signal trigger level.  The driver sets the IVIPWRMETER_ATTR_INTERNAL_TRIGGER_LEVEL attribute to this value.

The value of this attribute is specified in the same unit as the value of the IVIPWRMETER_ATTR_UNITS attribute which you can set by calling the IviPwrMeter_ConfigureUnits function.

Default Value: 0.001   -   �  �    Instrument Handle                �#����  �    Status                           � = � �  �    Trigger Level                          	           0.001    =    This function enables or disables the reference oscillator.        Pass VI_TRUE to enable the reference oscillator. Pass VI_FALSE to disable the reference oscillator. The driver sets the IVIPWRMETER_ATTR_REF_OSCILLATOR_ENABLED attribute to this value.  

Valid Values: 
    VI_TRUE - "On"
    VI_FALSE - "Off"

Default Value:
    VI_TRUE - "On"
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   !3 E �  �    Reference Oscillator Enabled     "S-   �  �    Instrument Handle                ##����  �    Status                            On VI_TRUE Off VI_FALSE        	           g    This function sets the frequency and power level of the signal generated by the reference oscillator.     �    The frequency of the reference oscillator. The driver sets the IVIPWRMETER_ATTR_REF_OSCILLATOR_FREQUENCY attribute to this value.


Units:  Hertz.

Default Value:  50 MHz     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The power level of the reference oscillator. The driver sets the IVIPWRMETER_ATTR_REF_OSCILLATOR_LEVEL attribute to this value.

Units:  dBm.

Default Value:  0 dBm   +l = � �  �    Frequency                        , -   �  �    Instrument Handle                ,�#����  �    Status                           4  =� �  �    Level                              50E6        	           0   �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    C    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   :�-   �  �    Instrument Handle                ;M#����  �    Status                           Bm � � �  �    Attribute Value                 ���� � ���                                          D� = � � �    Attribute ID                     I� =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   T�-   �  �    Instrument Handle                Ul#����  �    Status                           \� � � �  �    Attribute Value                 ���� � ���                                          ^� = � � �    Attribute ID                     c� =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString 
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   n�-   �  �    Instrument Handle                o�#����  �    Status                           v� � � �  �    Attribute Value                 ���� � ���                                          x� = � � �    Attribute ID                     ~ =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     �7 =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  � =  �  �    Channel Name                     �[ = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �.-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                  �� =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                О#����  �    Status                           ׾ � � �  �    Attribute Value                  �u =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the number of bytes in the value, pass a negative number for the Buffer Size parameter.

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviPwrMeter_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the number of bytes in the ViChar buffer you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size-1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value:  512    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                �a#����  �    Status or Required Size          �? � L � �    Attribute Value                  �c =  �  �    Channel Name                     �� =� �  �    Buffer Size                      �� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                q#����  �    Status                           � � � �  �    Attribute Value                  I =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

This is a low-level function that you can use to get the values of inherent IVI attributes, class defined attributes, and instrument-specific attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  
    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Help text is
  shown for each attribute.  Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   f-   �  �    Instrument Handle                &#����  �    Status                           %F � � �  �    Attribute Value                  &� =  �  �    Channel Name                     +M = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    '    Pass the value that you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    B    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt32 type.
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box.  The data
  types that are not consistent with this function are dim.
  If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   1�-   �  �    Instrument Handle                2I#����  �    Status                           9i � � �  �    Attribute Value                  ;� =  �  �    Channel Name                    ���� � ���                                          ?� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   G(-   �  �    Instrument Handle                G�#����  �    Status                           O � � �  �    Attribute Value                  Q8 =  �  �    Channel Name                    ���� � ���                                          U� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    D    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   \�-   �  �    Instrument Handle                ]�#����  �    Status                           d� � � �  �    Attribute Value                  f� =  �  �    Channel Name                    ���� � ���                                          k) = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   rm-   �  �    Instrument Handle                s-#����  �    Status                           zM � � �  �    Attribute Value                  |} =  �  �    Channel Name                    ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    G    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""
    E    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes.  Attributes 
  whose value cannot be set are dim.  Help text is shown for 
  each attribute.  Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box.  If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  The data types that are not consistent with this function are
  dim. If you select an attribute data type that is dim,
  LabWindows/CVI transfers you to the function panel for the
  corresponding function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has constants as valid
  values, you can view the constants by moving to the Attribute
  Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                  �! =  �  �    Channel Name                    ���� � ���                                          �p = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    �    This function performs a zero correction on the specified channel. You may use the IviPwrMeter_IsZeroComplete function to determine when the zero correction is complete.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The name for the channel for which to perform the zero correction.

Pass the virtual channel name that you assign to the instrument in the Action Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� =  �  �    Channel Name                           	           ""    �    This function performs a zero correction on all enabled channels. You may use the IviPwrMeter_IsZeroComplete function to determine when the zero correction is complete.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �s-   �  �    Instrument Handle                �3#����  �    Status                                 	              This function queries the instrument to determine the status of all zero correction operations initiated by the IviPwrMeter_Zero or IviPwrMeter_ZeroAllChannels functions. This function returns the IVIPWRMETER_VAL_ZERO_COMPLETE (1) value in the Status parameter only when zero corrections are complete on all enabled channels.

If some zero correction operations are still in progress on one or more channels, this function returns the IVIPWRMETER_VAL_ZERO_IN_PROGRESS (0) value. If the driver cannot query the instrument to determine its state, the driver returns the IVIPWRMETER_VAL_ZERO_STATUS_UNKNOWN (-1) value.

Note:

This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.
    �    Returns the status of the zero correction.

This driver defines the following zero correction status:

IVIPWRMETER_VAL_ZERO_COMPLETE (1)
    - The power meter has completed all zero correction
      operations.

IVIPWRMETER_VAL_ZERO_IN_PROGRESS (0)
    - The power meter is still performing a zero correction on 
      one or more enabled channels.

IVIPWRMETER_VAL_ZERO_STATUS_UNKNOWN (-1)
    - The power meter cannot determine the status of 
      the zero correction.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �� =F �  �    Zero Correction Status           ��-   �  �    Instrument Handle                ��#����  �    Status                             	                	           �    This function performs calibration on the specified sensor. This function returns only after the sensor has been calibrated.  You may use the IviPwrMeter_IsCalibrationComplete function to determine when the calibration is complete.        The name of the channel to calibrate.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �R =  �  �    Channel Name                     �]-   �  �    Instrument Handle                �#����  �    Status                             ""        	          �    This function queries the instrument to determine the status of all calibration operations initiated by the IviPwrMeter_Calibrate function. This function returns the IVIPWRMETER_VAL_CALIBRATION_COMPLETE (1) value in the Status parameter only when calibration is complete on all channels.

If some calibration operations are still in progress on one or more channels, the driver returns the IVIPWRMETER_VAL_CALIBRATION_IN_PROGRESS (0) value. If the driver cannot query the instrument to determine its state, the driver returns the IVIPWRMETER_VAL_CALIBRATION_STATUS_UNKNOWN (-1) value.

Note:

This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.
    �    Returns the status of the calibration.

This driver defines the following calibration status:

IVIPWRMETER_VAL_CALIBRATION_COMPLETE (1)
    - The power meter has completed the calibration on 
      all enabled channels.

IVIPWRMETER_VAL_CALIBRATION_IN_PROGRESS (0)
    - The power meter is still taking a calibration on 
      one or more enabled channels.

IVIPWRMETER_VAL_CALIBRATION_STATUS_UNKNOWN (-1)
    - The power meter cannot determine the status of 
      the calibration.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �� =F �  �    Calibration Status               ��-   �  �    Instrument Handle                ֗#����  �    Status                             	                	          �    This function initiates a measurement, waits until the power meter has returned to the Idle state, and returns the result of the measurement.

After this function executes, the value of the Reading parameter depends on the math operation specified in the IviPwrMeter_ConfigureMeasurement function.
 
If an out of range condition occurs on one or more enabled channels, the reading is a value indicating that an out of range condition occurred. In such a case, the Reading parameter contains an IEEE defined -Inf (Negative Infinity) or +Inf (Positive Infinity) value and the function returns the Under Range (0x3FFA2001) or Over Range (0x3FFA2002) warning. Test if the measurement value is out of range with the IviPwrMeter_QueryResultRangeType function.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Returns the measured value.

For single channel measurements, the Reading parameter contains an actual reading on the channel specified by the IviPwrMeter_ConfigureMeasurement function. The unit of the result is the same as the value of the Units attribute.

For dual channel measurements, the Reading parameter contains the result of the math operation applied to the channels specified in the IviPwrMeter_ConfigureMeasurement function. The unit of the result depends on the value of the IVIPWRMETER_ATTR_UNITS attribute and the specified operator.

For Difference and Sum operations, the resulting units is the same as the Units attribute.

For Quotient operations, the resulting units are in dB, except when Units are set to Watts.  When set to Watts, the resulting measurement is without units.    6    Pass the maximum length of time in which to allow the read operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIPWRMETER_ERROR_MAX_TIME_EXCEEDED (0xBFFA2020) error code.  When this occurs, you can call IviPwrMeter_Abort to cancel the read operation and return the instrument to the Idle state.  

Defined Values:
IVIPWRMETER_VAL_MAX_TIME_INFINITE (-1) - Wait indefinitely for a timeout.
IVIPWRMETER_VAL_MAX_TIME_IMMEDIATE (0) - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.

(2) Some specific instrument drivers do not support the Immediate Timeout or the Infinite Timeout defined values.
   �n#����  �    Status                           �-   �  �    Instrument Handle                �N =� �  �    Reading                          �v = � �  �    Maximum Time (ms)                  	               	           5000   �    This function initiates a measurement, waits until the power meter has returned to the Idle state, and returns the result of the measurement on the specified channel.

After this function executes, the Reading parameter contains an actual reading on the channel specified by the Channel parameter. If the specified channel is not enabled for measurement, this function returns the Channel Not Enabled (0xBFFA2001) error. The Reading result is in the same unit as the value of the Units attribute.

After this function executes, the Reading parameter may contain a value indicating that an out-of-range condition occurred. If an out-of-range condition occurs, the Result parameter contains an IEEE defined -Inf (Negative Infinity) or +Inf (Positive Infinity) value and the function returns the Under Range (0x3FFA2001) or Over Range (0x3FFA2002) warning. Test if the measurement value is out of range with the IviPwrMeter_QueryResultRangeType function.  

        The name of the channel from which to read the measurement.

Pass the virtual channel name that you assign to the instrument in the Action Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the maximum length of time in which to allow the read operation to complete.  Express this value in milliseconds.  

If the operation does not complete within this time interval, the function returns the IVIPWRMETER_ERROR_MAX_TIME_EXCEEDED (0xBFFA2020) error code.  When this occurs, you can call IviPwrMeter_Abort to cancel the read operation and return the instrument to the Idle state.  

Defined Values:
IVIPWRMETER_VAL_MAX_TIME_INFINITE (-1) - Wait indefinitely for a timeout.
IVIPWRMETER_VAL_MAX_TIME_IMMEDIATE (0) - Do not wait for a timeout.

Default Value: 5000

Notes:

(1) The Maximum Time parameter affects only this function.  It has no effect on other timeout parameters or attributes.
     %    The data read from the power meter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �q =  �  �    Channel Name                     �� = � �  �    Maximum Time (ms)                �V =� �  �    Reading                          ��-   �  �    Instrument Handle                �C#����  �    Status                             ""    5000    	               	          �    This function initiates a measurement on all enabled channels. When this function executes, the power meter leaves the Idle state and takes a measurement on all enabled channels. Use the IviPwrMeter_Fetch or IviPwrMeter_FetchChannel function to obtain the result of the measurements.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.

(2) This function performs interchangeability checking when the IVIPWRMETER_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  You may use the NI I/O Trace utility to view interchangeability warnings.  Alternatively, you may use the IviPwrMeter_GetNextInterchangeWarning function to retrieve interchangeability warnings.  For information on interchangeability checking, refer to the online help manual.

(3) The class driver initiates a simulated measurement when this function is called and the IVIPWRMETER_ATTR_SIMULATE attribute is set to VI_TRUE and the IVIPWRMETER_ATTR_USE_SPECIFIC_SIMULATION attribute is set to VI_FALSE.  For information on how to configure a simulated measurement, refer to the online help manual.        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   
=#����  �    Status                           ]-   �  �    Instrument Handle                  	              �    This function queries the instrument to determine the status of the measurement initiated by the IviPwrMeter_Initiate function. This function returns the IVIPWRMETER_VAL_MEAS_COMPLETE (1) value  in the Status parameter only when measurements are complete on all enabled channels.

If some measurements are still in progress on one or more channels, the driver returns the IVIPWRMETER_VAL_MEAS_IN_PROGRESS (0) value. If the driver cannot query the instrument to determine its state, the driver returns the IVIPWRMETER_VAL_MEAS_STATUS_UNKNOWN (-1) value.

Note:

This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
    �    Returns the status of the measurement.

This driver defines the following measurement status:

IVIPWRMETER_VAL_MEAS_COMPLETE (1)
    - The power meter has completed the measurement on 
      all enabled channels.

IVIPWRMETER_VAL_MEAS_IN_PROGRESS (0)
    - The power meter is still taking a measurement on 
      one or more enabled channels.

IVIPWRMETER_VAL_MEAS_STATUS_UNKNOWN (-1)
    - The power meter cannot determine the status of 
      the measurement.   p-   �  �    Instrument Handle                0#����  �    Status                           P =F �  �    Measurement Status                     	           	           �    This function returns the result from a previously initiated single or dual channel measurement. Call the IviPwrMeter_Initiate function to initiate a measurement before calling this function.
After this function executes, the value of the Reading parameter depends on the math operation specified in the IviPwrMeter_ConfigureMeasurement function.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.

(2) If an out-of-range condition occurs on one or more enabled channels, the result is a value indicating that an out of range condition occurred. In such a case, the Reading parameter contains an IEEE defined -Inf (Negative Infinity) or +Inf (Positive Infinity) value and the function returns the Under Range (0x3FFA2001) or Over Range (0x3FFA2002) warning. Test if the measurement value is out of range with the IviPwrMeter_QueryResultRangeType function.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Returns the measured value.

For single channel measurements, the Reading parameter contains an actual reading on the channel specified by the IviPwrMeter_ConfigureMeasurement function. The unit of the result is the same as the value of the Units attribute.

For dual channel measurements, the Reading parameter contains the result of the math operation applied to the channels specified in the IviPwrMeter_ConfigureMeasurement function. The unit of the result depends on the value of the IVIPWRMETER_ATTR_UNITS attribute and the specified operator.

For Difference and Sum operations, the resulting units is the same as the Units attribute.

For Quotient operations, the resulting units are in dB, except when Units are set to Watts.  When set to Watts, the resulting measurement is without units.   %�#����  �    Status                           ,�-   �  �    Instrument Handle                -� =� �  �    Reading                            	               	          Z    This function returns the result from a previously initiated measurement on a specified channel. Call the IviPwrMeter_Initiate function to initiate a measurement before calling this function.

After this function executes, the Reading parameter contains an actual reading on the channel specified by the Channel parameter. If the specified channel is not enabled for measurement, this function returns the Channel Not Enabled (0xBFFA2001) error. The result is in the same unit as the value of the Units attribute.

Notes:

(1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.

(2) If an out of range condition occurs, the result is a value indicating that an out-of-range condition occurred. In such a case, the Reading parameter contains an IEEE defined -Inf (Negative Infinity) or +Inf (Positive Infinity) value and the function returns the Under Range (0x3FFA2001) or Over Range (0x3FFA2002) warning. Test if the measurement value is out of range with the IviPwrMeter_QueryResultRangeType function.

        The name of the channel from which to fetch the measurement.

Pass the virtual channel name that you assign to the instrument in the Action Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings. The instrument-specific channel strings can differ from one instrument to another. Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code. You assign a virtual channel name to an instrument-specific channel through the Configuration Utility. This control accepts virtual channel names you have assigned to the specific instrument you are using. It also accepts the instrument-specific channel names.

Default Value: ""

Notes: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     %    The data read from the power meter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
No defined status codes.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA2000 to 3FFA3FFF     IviScope Warnings
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA2000 to BFFA3FFF     IviScope Errors
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP   Driver Errors
   6� =  �  �    Channel Name                     :� =� �  �    Reading                          ;)-   �  �    Instrument Handle                ;�#����  �    Status                             ""    	               	           �    This function takes a measurement value that is returned from one of the Fetch, Fetch Channel, Read, or Read Channel functions and determines if the value is a valid measurement value or a value indicating that an out-of-range condition occurred.        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns whether the measurement value is a valid measurement or a value indicating that the power meter encountered an out-of-range condition.

This driver defines the following range type:

IVIPWRMETER_VAL_IN_RANGE (0)  
    - The measurement is within the current
      range limits.

IVIPWRMETER_VAL_UNDER_RANGE (-1) 
    - The measurement is below the current
      lower range limits.

IVIPWRMETER_VAL_OVER_RANGE (1)
    - The measurement is above the current
      upper range limits.

     �    Pass the measurement value that you obtain from one of the Fetch or Read functions.  The driver tests this value to determine if the value is a valid measurement value or a value indicating an out-of-range condition occurred.  

Default Value: 0.0   Dx#����  �    Status                           K�-   �  �    Instrument Handle                LX =F �  �    Range Type                       NN = N �  �    Measurement Value                  	               	            0.0   �     This function aborts all previously initiated measurements and returns the power meter to the Idle state.  You initiate measurement with the IviPwrMeter_Initiate function.

Notes:

 (1) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.

 (2) If the instrument cannot abort an initiated acquisition, this function returns the IVI_ERROR_FUNCTION_NOT_SUPPORTED error.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   S*#����  �    Status                           ZJ-   �  �    Instrument Handle                  	              Q    This function sends a command to trigger the power meter.  Call this function if you pass IVIPWRMETER_VAL_SOFTWARE_TRIG for the IVIPWRMETER_ATTR_TRIGGER_SOURCE attribute or the Trigger Source parameter of the IviPwrMeter_ConfigureTriggerSource function.

Notes:

(1) If the IVIPWRMETER_ATTR_TRIGGER_SOURCE is not set to the IVIPWRMETER_VAL_SOFTWARE_TRIG value, this function returns a Trigger Not Software (0xBFFA1001) error.

(2) This function does not check the instrument status.   Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  You use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviPwrMeter_error_query function at the conclusion of the sequence.


     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   ^�-   �  �    Instrument Handle                _�#����  �    Status                                 	          &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   he#����  �    Status                           o�-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   qX-   �  �    Instrument Handle                r#����  �    Status                                 	           �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   z=-   �  �    Instrument Handle                z�#����  �    Status                                 	           Z    This function runs the instrument's self test routine and returns the test result(s). 

     �    This control contains the value returned from the instrument self test.  A return value of zero indicates a successful self-test.  For any other code, see the device's operator's manual.

Valid Return Values:
0 - Self test passed
1 - Self test failed
     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

Note:

(1) You must pass a ViChar array with at least 256 bytes.        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �� =  �  �    Self Test Result                 �� = � � ,    Self-Test Message                ��#����  �    Status                           ��-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

Note:

(1) You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   � = 3 �  �    Instrument Driver Revision       �� =6 �  �    Firmware Revision                �G#����  �    Status                           �f-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �� =  �  �    Error Code                       �� = � � ,    Error Message                    �g#����  �    Status                           ��-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviPwrMeter Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Over range condition.
          
ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2020  Maximum operation time was exceeded.
          
IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviPwrMeter_error_query.
BFFA0002  Cannot open file.
BFFA0003  Error reading from file.
BFFA0004  Error writing to file.
BFFA0005  Driver module file not found.
BFFA0006  Cannot open driver module file for reading.
BFFA0007  Driver module has invalid file format or invalid data.
BFFA0008  Driver module contains undefined references.
BFFA0009  Cannot find function in driver module.
BFFA000A  Failure loading driver module.
BFFA000B  Invalid path name.
BFFA000C  Invalid attribute.
BFFA000D  IVI attribute is not writable.
BFFA000E  IVI attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0011  Function not supported.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0017  Specified item already exists.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001D  Object or item is not initialized.
BFFA001E  Non-interchangeable behavior.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0021  Unable to allocate system resource.
BFFA0022  Permission to access file was denied.
BFFA0023  Too many files are already open.
BFFA0024  Unable to create temporary file in target directory.
BFFA0025  All temporary filenames already used.
BFFA0026  Disk is full.
BFFA0027  Cannot find configuration file on disk.
BFFA0028  Cannot open configuration file.
BFFA0029  Error reading configuration file.
BFFA002A  Invalid ViInt32 value in configuration file.
BFFA002B  Invalid ViReal64 value in configuration file.
BFFA002C  Invalid ViBoolean value in configuration file.
BFFA002D  Entry missing from configuration file.
BFFA002E  Initialization failed in driver DLL.
BFFA002F  Driver module has unresolved external reference.
BFFA0030  Cannot find CVI Run-Time Engine.
BFFA0031  Cannot open CVI Run-Time Engine.
BFFA0032  CVI Run-Time Engine has invalid format.
BFFA0033  CVI Run-Time Engine is missing required function(s).
BFFA0034  CVI Run-Time Engine initialization failed.
BFFA0035  CVI Run-Time Engine has unresolved external reference.
BFFA0036  Failure loading CVI Run-Time Engine.
BFFA0037  Cannot open DLL for read exports.
BFFA0038  DLL file is corrupt.
BFFA0039  No DLL export table in DLL.
BFFA003A  Unknown attribute name in default configuration file.
BFFA003B  Unknown attribute value in default configuration file.
BFFA003C  Memory pointer specified is not known.
BFFA003D  Unable to find any channel strings.
BFFA003E  Duplicate channel string.
BFFA003F  Duplicate virtual channel name.
BFFA0040  Missing virtual channel name.
BFFA0041  Bad virtual channel name.
BFFA0042  Unassigned virtual channel name.
BFFA0043  Bad virtual channel assignment.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0048  Channel already excluded.
BFFA0049  Missing option name (nothing before the '=').
BFFA004A  Missing option value (nothing after the '=').
BFFA004B  Bad option name.
BFFA004C  Bad option value.
BFFA004D  Operation only valid on a class driver session.
BFFA004E  "ivi.ini" filename is reserved.
BFFA004F  Duplicate run-time configuration entry.
BFFA0050  Index parameter is one-based.
BFFA0051  Index parameter is too high.
BFFA0052  Attribute is not cacheable.
BFFA0053  You cannot export a ViAddr attribute to the end-user.
BFFA0054  Bad channel string in channel string list.
BFFA0055  Bad prefix name in default configuration file.
         
VISA Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFF0002 Event enabled for one or more specified mechanisms.
3FFF0003 Event disabled for one or more specified mechanisms.
3FFF0004 Successful, but queue already empty.
3FFF0005 Specified termination character was read.
3FFF0006 Number of bytes transferred equals input count.
3FFF0077 Configuration non-existant or could not be loaded.
3FFF007D Open successful, but the device not responding.
3FFF0080 Wait successful, but more event objects available.
3FFF0082 Specified object reference is uninitialized.
3FFF0084 Attribute value not supported.
3FFF0085 Status code could not be interpreted.
3FFF0088 Specified I/O buffer type not supported.
3FFF0098 Successful,  but invoke no handlers for this event.
3FFF0099 Successful but session has nested shared locks.
3FFF009A Successful but session has nested exclusive locks.
3FFF009B Successful but operation not asynchronous.
         
ERRORS:
BFFF0000 Unknown system error (miscellaneous error).
BFFF000E Session or object reference is invalid.
BFFF000F Resource is locked.
BFFF0010 Invalid expression specified for search.
BFFF0011 Resource is not present in the system.
BFFF0012 Invalid resource reference specified.  Parsing error.
BFFF0013 Invalid access mode.
BFFF0015 Timeout expired before operation completed.
BFFF0016 Unable to deallocate session data structures.
BFFF001B Specified degree is invalid.
BFFF001C Specified job identifier is invalid.
BFFF001D Attribute is not supported by the referenced object.
BFFF001E Attribute state not supported by the referenced object.
BFFF001F Specified attribute is read-only.
BFFF0020 Lock type lock not supported by this resource.
BFFF0021 Invalid access key.
BFFF0026 Specified event type not supported by the resource.
BFFF0027 Invalid mechanism specified.
BFFF0028 A handler was not installed.
BFFF0029 Handler reference either invalid or was not installed.
BFFF002A Specified event context invalid.
BFFF002D Event queue for specified type has overflowed.
BFFF002F Event type must be enabled in order to receive.
BFFF0030 User abort during transfer.
BFFF0034 Violation of raw write protocol during transfer.
BFFF0035 Violation of raw read protocol during transfer.
BFFF0036 Device reported output protocol error during transfer.
BFFF0037 Device reported input protocol error during transfer.
BFFF0038 Bus error during transfer.
BFFF0039 Unable to queue asynchronous operation.
BFFF003A Unable to start operation because setup is invalid.
BFFF003B Unable to queue the asynchronous operation.
BFFF003C Insufficient resources to perform memory allocation.
BFFF003D Invalid buffer mask specified.
BFFF003E I/O error.
BFFF003F Format specifier invalid.
BFFF0041 Format specifier not supported.
BFFF0042 Trigger line is currently in use.
BFFF004A Service request not received for the session.
BFFF004E Invalid address space specified.
BFFF0051 Invalid offset specified.
BFFF0052 Invalid access width specified.
BFFF0054 Offset not accessible from this hardware.
BFFF0055 Source and destination widths are different.
BFFF0057 Session not currently mapped.
BFFF0059 Previous response still pending.
BFFF005F No listeners condition detected.
BFFF0060 Interface not currently the controller in charge.
BFFF0061 Interface not the system controller.
BFFF0067 Session does not support this operation.
BFFF006A A parity error occurred during transfer.
BFFF006B A framing error occurred during transfer.
BFFF006C An overrun error occurred during transfer.
BFFF0070 Offset not properly aligned for operation access width.
BFFF0071 Specified user buffer not valid.
BFFF0072 Resource valid, but VISA cannot access it.
BFFF0076 Width not supported by this hardware.
BFFF0078 Invalid parameter value, parameter unknown.
BFFF0079 Invalid protocol.
BFFF007B Invalid window size.
BFFF0080 Session currently contains a mapped window.
BFFF0081 Operation not implemented.
BFFF0083 Invalid length.
BFFF0091 Invalid mode.
BFFF009C Session did not have a lock on the resource.
BFFF009D The device does not export any memory.
BFFF009E VISA-required code library not located or not loaded.
         
VXIPnP Driver Status Codes:
Status    Description
-------------------------------------------------
WARNINGS:
3FFC0101  Instrument does not have ID Query capability.
3FFC0102  Instrument does not have Reset capability.
3FFC0103  Instrument does not have Self-Test capability.
3FFC0104  Instrument does not have Error Query capability.
3FFC0105  Instrument does not have Revision Query capability.
          
ERRORS:
BFFC0001  Parameter 1 out of range, or error trying to set it.
BFFC0002  Parameter 2 out of range, or error trying to set it.
BFFC0003  Parameter 3 out of range, or error trying to set it.
BFFC0004  Parameter 4 out of range, or error trying to set it.
BFFC0005  Parameter 5 out of range, or error trying to set it.
BFFC0006  Parameter 6 out of range, or error trying to set it.
BFFC0007  Parameter 7 out of range, or error trying to set it.
BFFC0008  Parameter 8 out of range, or error trying to set it.
BFFC0011  Instrument failed the ID Query.
BFFC0012  Invalid response from instrument.
     �    Returns the user-readable message string that corresponds to the status code you specify.

Note:

(1) You must pass a ViChar array with at least 256 bytes.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
         The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   �� =  �  h    Error Code                       �� = � � �    Error Message                    �y#����  �    Status                           ϙ-   �  �    Instrument Handle                  0    	            	           VI_NULL    Q    This function invalidates the cached values of all attributes for the session.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �-   �  �    Instrument Handle                ��#����  �    Status                                 	           h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    a    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI      Warnings
3FFF0000 to 3FFFFFFF     VISA     Warnings
3FFC0000 to 3FFCFFFF     VXIPnP   Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI      Errors
BFFF0000 to BFFFFFFF     VISA     Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors

     Z    Returns the C session instrument handle you use to call the specific driver's functions.   ��-   �  �    Instrument Handle                ۟#����  �    Status                           � = � �  �    Specific Driver C Handle               	           	          �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIPWRMETER_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   � #����  �    Status                           ��-   �  �    Instrument Handle                � � Q � �    Coercion Record                  �� = � �  �    Buffer Size                        	               	               �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviPwrMeter_GetError or IviPwrMeter_ClearError.
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �m 3< �  �    BufferSize                       �M 3 P �  �    Code                             �� � Q � �    Description                      �-   �  �    Instrument Handle                �#����  �    Status or Required Size                	           	                	          p    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the "instrument handle" parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviPwrMeter_GetError function, which occurs when a call to IviPwrMeter_init or IviPwrMeter_InitWithOptions fails.     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   &-   �  �    Instrument Handle                �#����  �    Status                                 	          2    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVIPWRMETER_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   � = � �  �    Buffer Size                      � � Q � �    Interchange Warning              "�-   �  �    Instrument Handle                #�#����  �    Status or Required Size                	                	           A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   -�-   �  �    Instrument Handle                .}#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviPwrMeter_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviPwrMeter_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviPwrMeter_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   <�-   �  �    Instrument Handle                =�#����  �    Status                                 	          \    This function obtains a multithread lock on the instrument session.  Before doing so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviPwrMeter_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviPwrMeter_LockSession returns successfully, no other threads can access the instrument session until you call IviPwrMeter_UnlockSession.

Use IviPwrMeter_LockSession and IviPwrMeter_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviPwrMeter_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviPwrMeter_LockSession with a call to IviPwrMeter_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviPwrMeter_LockSession and IviPwrMeter_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviPwrMeter_LockSession.  This allows you to call IviPwrMeter_UnlockSession just once at the end of the function. 
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviPwrMeter_LockSession or IviPwrMeter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviPwrMeter_LockSession and IviPwrMeter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviPwrMeter_LockSession does not lock the session again.  If the value is VI_FALSE, IviPwrMeter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviPwrMeter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviPwrMeter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
You can then call IviPwrMeter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviPwrMeter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviPwrMeter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviPwrMeter_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviPwrMeter_UnlockSession(vi, &haveLock);
    return error;
}   J�#����  �    Status                           Q�-   �  �    Instrument Handle                R� H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviPwrMeter_LockSession.  Refer to IviPwrMeter_LockSession for additional information on session locks.
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviPwrMeter_LockSession or IviPwrMeter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviPwrMeter_LockSession and IviPwrMeter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviPwrMeter_LockSession does not lock the session again.  If the value is VI_FALSE, IviPwrMeter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviPwrMeter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviPwrMeter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
You can then call IviPwrMeter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviPwrMeter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviPwrMeter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviPwrMeter_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock.  Fortunately, the haveLock 
       variable takes care of that for you.          
    */
    IviPwrMeter_UnlockSession(vi, &haveLock);
    return error;
}   [�#����  �    Status                           c-   �  �    Instrument Handle                c� H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviPwrMeter_close.

(2) After calling IviPwrMeter_close, you cannot use the instrument driver again until you call IviPwrMeter_init or IviPwrMeter_InitWithOptions.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviPwrMeter_error_message function.  To obtain additional information about the error condition, call the IviPwrMeter_GetError function.  To clear the error information from the driver, call the IviPwrMeter_ClearError function.
          
The general meaning of the status code is as follows:

Value                  Meaning
-------------------------------
0                      Success
Positive Values        Warnings
Negative Values        Errors

This driver defines the following status codes:
          
Status    Description
-------------------------------------------------
WARNINGS:
3FFA2001  Measurement is under range.
3FFA2002  Measurement is over range.

ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  The channel is not enabled for measurement.
BFFA2020  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviPwrMeter_init or IviPwrMeter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   nG#����  �    Status                           ug-   �  �    Instrument Handle                  	            ����           #�             K.        init                                                                                                                                    ����         %M  A�             K.        InitWithOptions                                                                                                                         ����         C�  Me             K.        ConfigureUnits                                                                                                                          ����         N�  `d             K.        ConfigureMeasurement                                                                                                                    ����         b  o�             K.        ConfigureRangeAutoEnabled                                                                                                               ����         p�  }�             K.        ConfigureAveragingAutoEnabled                                                                                                           ����           ��             K.        ConfigureCorrectionFrequency                                                                                                            ����         ��  ��             K.        ConfigureOffset                                                                                                                         ����         ��  �`             K.        ConfigureRange                                                                                                                          ����         ��  ��             K.        ConfigureAveragingCount                                                                                                                 ����         ��  ʏ             K.        ConfigureDutyCycleCorrection                                                                                                            ����         ��  �              K.        GetChannelName                                                                                                                          ����         �.  �F             K.        ConfigureChannelEnabled                                                                                                                 ����         �K u             K.        ConfigureTriggerSource                                                                                                                  ����        � �             K.        ConfigureInternalTrigger                                                                                                                ����        �  6             K.        ConfigureInternalTriggerLevel                                                                                                           ����         � *3             K.        ConfigureRefOscillatorEnabled                                                                                                           ����        *� 4�             K.        ConfigureRefOscillator                                                                                                                  ����        5� N"             K.        SetAttributeViInt32                                                                                                                     ����        O� hC             K.        SetAttributeViReal64                                                                                                                    ����        i� �d             K.        SetAttributeViString                                                                                                                    ����        �� ��             K.        SetAttributeViBoolean                                                                                                                   ����        �! ��             K.        SetAttributeViSession                                                                                                                   ����        �C ̵             K.        GetAttributeViInt32                                                                                                                     ����        �� �g             K.        GetAttributeViReal64                                                                                                                    ����        � K             K.        GetAttributeViString                                                                                                                    ����        � <             K.        GetAttributeViBoolean                                                                                                                   ����        y /�             K.        GetAttributeViSession                                                                                                                   ����        1. E1             K.        CheckAttributeViInt32                                                                                                                   ����        F� Z�             K.        CheckAttributeViReal64                                                                                                                  ����        \n pu             K.        CheckAttributeViString                                                                                                                  ����        r �             K.        CheckAttributeViBoolean                                                                                                                 ����        �� ��             K.        CheckAttributeViSession                                                                                                                 ����        �X �             K.        Zero                                                                                                                                    ����        �� �S             K.        ZeroAllChannels                                                                                                                         ����        �� ��             K.        IsZeroComplete                                                                                                                          ����        �a �=             K.        Calibrate                                                                                                                               ����        �� ݷ             K.        IsCalibrationComplete                                                                                                                   ����        �r �             K.        Read                                                                                                                                    ����        � c             K.        ReadChannel                                                                                                                             ����        �              K.        Initiate                                                                                                                                ����        �  '             K.        IsMeasurementComplete                                                                                                                   ����         � 0�             K.        Fetch                                                                                                                                   ����        1 B�             K.        FetchChannel                                                                                                                            ����        Cx OO             K.        QueryResultRangeType                                                                                                                    ����        PF [
             K.        Abort                                                                                                                                   ����        [� f�             K.        SendSoftwareTrigger                                                                                                                     ����        g7 pE             K.        reset                                                                                                                                   ����        p� y7             K.        ResetWithDefaults                                                                                                                       ����        y� �             K.        Disable                                                                                                                                 ����        �� ��             K.        self_test                                                                                                                               ����        �� �&             K.        revision_query                                                                                                                          ����        �" �G             K.        error_query                                                                                                                             ����        �C ��             K.        error_message                                                                                                                           ����        ѽ ��             K.        InvalidateAllAttributes                                                                                                                 ����        �o �j             K.        GetSpecificDriverCHandle                                                                                                                ����        �% ��             K.        GetNextCoercionRecord                                                                                                                   ����        �� y             K.        GetError                                                                                                                                ����        �              K.        ClearError                                                                                                                              ����         ,�             K.        GetNextInterchangeWarning                                                                                                               ����        -t 5�             K.        ClearInterchangeWarnings                                                                                                                ����        6 D�             K.        ResetInterchangeCheck                                                                                                                   ����        EJ Z�             K.        LockSession                                                                                                                             ����        [> k�             K.        UnlockSession                                                                                                                           ����        l� v'             K.        close                                                                                                                                         $                                                                                     �Initialize                                                                           �Initialize With Options                                                             wConfiguration                                                                        �Configure Units                                                                      �Configure Measurement                                                                �Configure Range Auto Enabled                                                         �Configure Averaging Auto Enabled                                                     �Configure Correction Frequency                                                       �Configure Offset                                                                     �Configure Range [RNG]                                                                �Configure Averaging Count [AVG]                                                      �Configure Duty Cycle Correction [DC]                                                 �Get Channel Name                                                                     �Configure Channel Enabled [CH]                                                      �Trigger                                                                              �Configure Trigger Source [TRG]                                                       �Configure Internal Trigger [IT]                                                      �Configure Internal Trigger Level [IT]                                               �Reference Oscillator                                                                 �Configure Reference Oscillator Enabled [RO]                                          �Configure Reference Oscillator [RO]                                                 0Set/Get/Check Attribute                                                             �Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             �Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           LZeroing                                                                              �Zero [ZC]                                                                            �Zero All Channels [ZC]                                                               �Is Zero Correction Complete [ZC]                                                    �Calibration                                                                          �Calibrate [CAL]                                                                      �Is Calibration Complete [CAL]                                                       �Measurement                                                                          �Read                                                                                 �Read Channel [CH]                                                                   	hLow-Level Measurement                                                                �Initiate                                                                             �Is Measurement Complete                                                              �Fetch                                                                                �Fetch Channel [CH]                                                                   �Query Result Range Type                                                              �Abort                                                                                �Send Software Trigger [SWT]                                                         
�Utility                                                                              �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Specific Driver C Handle                                                         �Get Next Coercion Record                                                            �Error                                                                                �Get Error                                                                            �Clear Error                                                                         PInterchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             �Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           