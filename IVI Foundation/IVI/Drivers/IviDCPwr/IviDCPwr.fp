s��   	     �   B ��  %`   �   ����                                IviDCPwr                        IviDCPwr Class Driver                                                                                 � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr      This instrument driver provides programming support for the IviDCPwr Class.  The driver contains all the functions that the IVI Foundation and VXIplug&play Systems Alliance require.  This driver requires the VISA and IVI libraries.
      
Use this driver to develop programs that are independent of a particular power supply.  You can use this class driver with any power supply that has an IVI instrument-specific driver that is compliant with the IviDCPwr class.  The IviDCPwr class driver accesses the specific driver for your instrument using the configuration information you supply with the IVI configuration utility.
      
The IviDCPwr class driver divides instrument capabilities into a fundamental capabilities group and multiple extension capability groups.  The IviDCPwrBase fundamental capabilities group supports basic DC power supply functionality.  This group consists of the following functions and attributes.  These functions and attributes are implemented by all power supply  instrument drivers that are compliant with the IviDCPwr class.

      IviDCPwr_ConfigureOutputEnabled
      IviDCPwr_ConfigureOutputRange
      IviDCPwr_ConfigureCurrentLimit
      IviDCPwr_ConfigureOVP
      IviDCPwr_ConfigureVoltageLevel
      IviDCPwr_QueryOutputState
      IviDCPwr_ResetOutputProtection

      IVIDCPWR_ATTR_VOLTAGE_LEVEL
      IVIDCPWR_ATTR_OVP_ENABLED
      IVIDCPWR_ATTR_OVP_LIMIT
      IVIDCPWR_ATTR_CURRENT_LIMIT_BEHAVIOR
      IVIDCPWR_ATTR_CURRENT_LIMIT
      IVIDCPWR_ATTR_OUTPUT_ENABLED
      
The IviDCPwr class driver identifies functions and attributes that belong to an extension group with the following abbreviations.  Instrument-specific drivers are not required to implement any of the extension capability groups.  If you use functions and attributes that belong to extension capability groups, every instrument-specific driver that you use must implement those extensions.
      
      Extension Capability Group        Abbreviation
      ----------------------------------------------
      IviDcPwrTrigger                      [TRG]
      IviDCPwrSoftwareTrigger              [SWT]
      IviDCPwrMeasure                      [MSR]
      
The IviDCPwrTrigger extension group supports power supplies that can make changes to the output signal based on a trigger event.  This group consists of the following functions and attributes:

      IviDCPwr_ConfigureTriggerSource
      IviDCPwr_ConfigureTriggeredVoltageLevel
      IviDCPwr_ConfigureTriggeredCurrentLimit
      IviDCPwr_Abort
      IviDCPwr_Initiate

      IVIDCPWR_ATTR_TRIGGER_SOURCE
      IVIDCPWR_ATTR_TRIGGERED_CURRENT_LIMIT
      IVIDCPWR_ATTR_TRIGGERED_VOLTAGE_LEVEL

The IviDCPwrSoftwareTrigger extension group supports power supplies that can make changes to the output signal based on a software trigger event.  This group consists of the following function:

      IviDCPwr_SendSoftwareTrigger

The IviDCPwrMeasure extension group supports power supplies that can make measurements on the output signal.  This group consists of the following function:

      IviDCPwr_Measure     �    This class contains functions that configure the instrument.  The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     ;    This class contains functions for configuring the output.     C    This class contains functions for configuring the trigger system.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     ]    This class contains functions that initiate instrument operations and report their status.
    F    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation and lock the session.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    F    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviDCPwr_LockSession and IviDCPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.
    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SamplePowerSupply"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviDCPwr_LockSession and IviDCPwr_UnlockSession to protect sections of code that require exclusive access to the resource.

    N    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     =   �  �    Logical Name                      � : �       ID Query                           � =� �       Reset Device                      !� �C �  �    Instrument Handle                 $m#����  �    Status                             "SamplePowerSupply"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          P    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVIDCPWR_ATTR_RANGE_CHECK         
    IVIDCPWR_ATTR_QUERY_INSTRUMENT_STATUS  
    IVIDCPWR_ATTR_CACHE               
    IVIDCPWR_ATTR_SIMULATE            
    IVIDCPWR_ATTR_RECORD_COERCIONS    

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviDCPwr_LockSession and IviDCPwr_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SamplePowerSupply"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviDCPwr_LockSession and IviDCPwr_UnlockSession to protect sections of code that require exclusive access to the resource.

    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIDCPWR_ATTR_RANGE_CHECK
QueryInstrStatus  IVIDCPWR_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIDCPWR_ATTR_CACHE   
Simulate          IVIDCPWR_ATTR_SIMULATE  
RecordCoercions   IVIDCPWR_ATTR_RECORD_COERCIONS
InterchangeCheck  IVIDCPWR_ATTR_INTERCHANGE_CHECK

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the driver uses the values from the Measurement and Automation Explorer's IVI Configuration Utility.   You can override these values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, the driver uses the value from the IVI Configuration Utility.  

The following are the valid values for ViBoolean attributes:

    True:     1, TRUE, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    3� =   �  �    Logical Name                      7] : �       ID Query                          9h =� �       Reset Device                      :" �Y �  �    Instrument Handle                 <�#����  �    Status                            C@ �  � �    Option String                      "SamplePowerSupply"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    l    Configures whether the signal that the power supply produces on a channel appears at the output connector.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
        Pass whether you want the signal the power supply produces on a channel to appear at the output connector.  The driver uses this value to set the IVIDCPWR_ATTR_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE  - Enable the output
VI_FALSE - Disable the output

Default Value:  VI_TRUE
    KZ-   �  �    Instrument Handle                 L#����  �    Status                            Rt 3 
 �  �    Channel Name                      Vb 3 � �  �    Enabled                                	           ""   True VI_TRUE False VI_FALSE   Y    Configures the power supply's output range on a channel.  You specify whether you want to configure the voltage or current range, and the value to which to set the range.

Notes:

1) Setting a voltage range can invalidate a previously configured current range.

2) Setting a current range can invalidate a previously configured voltage range.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the range in which you want the power supply to operate.  

If you pass a value of IVIDCPWR_VAL_RANGE_CURRENT for the RangeType parameter, you specify this parameter in amps.

If you pass a value of IVIDCPWR_VAL_RANGE_VOLTAGE for the RangeType parameter, you specify this parameter in volts.

Units: volts (for voltage range)
       amps  (for current range)

Default Value:  0.0
    o    Pass the type of range you want to configure.

Defined Values:
IVIDCPWR_VAL_RANGE_VOLTAGE - Voltage Range
IVIDCPWR_VAL_RANGE_CURRENT - Current Range

Default Value:  IVIDCPWR_VAL_RANGE_VOLTAGE

Notes:

1) Setting a voltage range can invalidate a previously configured current range.

2) Setting a current range can invalidate a previously configured voltage range.
    Y�-   �  �    Instrument Handle                 Z�#����  �    Status                            a 3 
 �  �    Channel Name                      d� 3� �  �    Range                             f� 3 � � �    Range Type                             	           ""    0.0               FVoltage IVIDCPWR_VAL_RANGE_VOLTAGE Current IVIDCPWR_VAL_RANGE_CURRENT    �    This function configures the current limit.  You specify the output current limit value and the behavior of the power supply when the output current is greater than or equal to that value.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the behavior you want the power supply to exhibit when the  ouptut current is greater than or equal to the value of the limit parameter.   The driver uses this value to set the IVIDCPWR_ATTR_CURRENT_LIMIT_BEHAVIOR attribute.

Defined Values:
IVIDCPWR_VAL_CURRENT_REGULATE - Regulatory limit
IVIDCPWR_VAL_CURRENT_TRIP     - Trip limit

Default Value: IVIDCPWR_VAL_CURRENT_REGULATE
     �    Pass the current limit you want to use. The driver uses this value to set the IVIDCPWR_ATTR_CURRENT_LIMIT attribute.

Units: amps

Default Value: 0.0
    j?-   �  �    Instrument Handle                 j�#����  �    Status                            qY 3 
 �  �    Channel Name                      uG 3 � � �    Behavior                          v� 3� �  �    Limit                                  	           ""               FRegulate IVIDCPWR_VAL_CURRENT_REGULATE Trip IVIDCPWR_VAL_CURRENT_TRIP    0.0   d    This function configures the power supply's over-voltage protection.  You specify the over-voltage limit and the behavior of the power supply when the output voltage is greater than or equal to that value.

When the enabled parameter is VI_FALSE, the limit parameter does not affect the instrument's behavior, and the driver ignores the limit parameter.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass whether you want to enable or disable the OVP limit.   The driver uses this value to set the IVIDCPWR_ATTR_OVP_ENABLED attribute.

Valid Values:
VI_TRUE  - Enable OVP limit
VI_FALSE - Disable OVP limit

Default Value: VI_TRUE
     �    Pass the over-voltage protection limit you want to use. The driver uses this value to set the IVIDCPWR_ATTR_OVP_LIMIT attribute.

Units: volts

Default Value: 0.0 volts
    zY-   �  �    Instrument Handle                 {#����  �    Status                            �s 3 
 �  �    Channel Name                      �a 3 � �  �    Enabled                           �R 3� �  �    Limit                                  	           ""   True VI_TRUE False VI_FALSE    0.0    [    This function configures the DC voltage level that the power supply attempts to generate.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the DC voltage you want the power supply to attempt to generate.  The driver sets the IVIDCPWR_ATTR_VOLTAGE_LEVEL attribute to this value.

Units: volts

Default Value: 0.0 volts
    ��-   �  �    Instrument Handle                 �g#����  �    Status                            �� 3 
 �  �    Channel Name                      �� 3 � �  �    Level                                  	           ""    0.0   �    This function configures the trigger source to which the power supply responds after you call IviDCPwr_Initiate.  When the power supply receives a trigger signal on the source you specify, it changes its current and voltage outputs.

You configure the triggered current and voltage outputs with the
IviDCPwr_ConfigureTriggeredCurrentLimit and 
IviDCPwr_ConfigureTriggeredVoltageLevel functions. 

Notes:

(1) This function is part of the IviDCPwrTrigger [TRG] extension group.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    
�    Pass the trigger source to which you want the power supply to respond.  The driver sets the IVIDCPWR_ATTR_TRIGGER_SOURCE attribute to this value.

Defined Values:
IVIDCPWR_VAL_TRIG_IMMEDIATE - The power supply does not wait for a trigger of any kind.

IVIDCPWR_VAL_TRIG_EXTERNAL - The power supply waits for a trigger on the external trigger input.

IVIDCPWR_VAL_SOFTWARE_TRIG - The power supply waits until you call the IviDCPwr_SendSoftwareTrigger function.

IVIDCPWR_VAL_TRIG_TTL0 - The power supply waits until it receives a trigger on the PXI TRIG0 line (for PXI instruments) or the VXI TTL0 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL1 - The power supply waits until it receives a trigger on the PXI TRIG1 line (for PXI instruments) or the VXI TTL1 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL2 - The power supply waits until it receives a trigger on the PXI TRIG2 line (for PXI instruments) or the VXI TTL2 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL3 - The power supply waits until it receives a trigger on the PXI TRIG3 line (for PXI instruments) or the VXI TTL3 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL4 - The power supply waits until it receives a trigger on the PXI TRIG4 line (for PXI instruments) or the VXI TTL4 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL5 - The power supply waits until it receives a trigger on the PXI TRIG5 line (for PXI instruments) or the VXI TTL5 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL6 - The power supply waits until it receives a trigger on the PXI TRIG6 line (for PXI instruments) or the VXI TTL6 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_TTL7 - The power supply waits until it receives a trigger on the PXI TRIG7 line (for PXI instruments) or the VXI TTL7 line (for VXI instruments).

IVIDCPWR_VAL_TRIG_ECL0 - The power supply waits until it receives a trigger on the VXI ECL0 line.

IVIDCPWR_VAL_TRIG_ECL1 - The power supply waits until it receives a trigger on the VXI ECL1 line.

IVIDCPWR_VAL_TRIG_PXI_STAR - The power supply waits until it receives a trigger on the PXI STAR trigger bus.
  
IVIDCPWR_VAL_TRIG_RTSI_0 - the power supply waits until it receives a trigger on RTSI line 0.

IVIDCPWR_VAL_TRIG_RTSI_1 - the power supply waits until it receives a trigger on RTSI line 1.

IVIDCPWR_VAL_TRIG_RTSI_2 - the power supply waits until it receives a trigger on RTSI line 2.

IVIDCPWR_VAL_TRIG_RTSI_3 - the power supply waits until it receives a trigger on RTSI line 3.

IVIDCPWR_VAL_TRIG_RTSI_4 - the power supply waits until it receives a trigger on RTSI line 4.

IVIDCPWR_VAL_TRIG_RTSI_5 - the power supply waits until it receives a trigger on RTSI line 5.

IVIDCPWR_VAL_TRIG_RTSI_6 - the power supply waits until it receives a trigger on RTSI line 6.


Default Value: IVIDCPWR_VAL_TRIG_IMMEDIATE

    �O-   �  �    Instrument Handle                 �	#����  �    Status                            �i 3 
 �  �    Channel Name                      �W 3 � � �    Source                                 	           ""              �Immediate IVIDCPWR_VAL_TRIG_IMMEDIATE External IVIDCPWR_VAL_TRIG_EXTERNAL Software IVIDCPWR_VAL_SOFTWARE_TRIG TTL0 IVIDCPWR_VAL_TRIG_TTL0 TTL1 IVIDCPWR_VAL_TRIG_TTL1 TTL2 IVIDCPWR_VAL_TRIG_TTL2 TTL3 IVIDCPWR_VAL_TRIG_TTL3 TTL4 IVIDCPWR_VAL_TRIG_TTL4 TTL5 IVIDCPWR_VAL_TRIG_TTL5 TTL6 IVIDCPWR_VAL_TRIG_TTL6 TTL7 IVIDCPWR_VAL_TRIG_TTL7 ECL0 IVIDCPWR_VAL_TRIG_ECL0 ECL1 IVIDCPWR_VAL_TRIG_ECL1 PXI Star IVIDCPWR_VAL_TRIG_PXI_STAR RTSI 0 IVIDCPWR_VAL_TRIG_RTSI_0 RTSI 1 IVIDCPWR_VAL_TRIG_RTSI_1 RTSI 2 IVIDCPWR_VAL_TRIG_RTSI_2 RTSI 3 IVIDCPWR_VAL_TRIG_RTSI_3 RTSI 4 IVIDCPWR_VAL_TRIG_RTSI_4 RTSI 5 IVIDCPWR_VAL_TRIG_RTSI_5 RTSI 6 IVIDCPWR_VAL_TRIG_RTSI_6    �    This function configures the DC voltage level the power supply attempts to generate after it receives a trigger.

Notes:

(1) This function is part of the IviDCPwrTrigger [TRG] extension group.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the DC voltage level you want the power supply to attempt to generate after it receives a trigger.  The driver sets the IVIDCPWR_ATTR_TRIGGERED_VOLTAGE_LEVEL attribute to this value.

Units: volts

Default Value: 0.0 volts
    ��-   �  �    Instrument Handle                 �[#����  �    Status                            �� 3 
 �  �    Channel Name                      �� 3 � �  �    Triggered Level                        	           ""    0.0    �    This function configures the current limit the power supply uses after it receives a trigger.

Notes:

(1) This function is part of the IviDCPwrTrigger [TRG] extension group.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the current limit you want the power supply to use after it receives a trigger.  The driver sets the IVIDCPWR_ATTR_TRIGGERED_CURRENT_LIMIT attribute to this value.

Units: amps

Default Value: 0.0 amps
    �A-   �  �    Instrument Handle                 ��#����  �    Status                            �[ 3 
 �  �    Channel Name                      �I 3 � �  �    Triggered Limit                        	           ""    0.0   �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    ��-   �  �    Instrument Handle                 Ѡ#����  �    Status                            �  � � �  �    Attribute Value                 ���� � ���                                           � = � � �    Attribute ID                      �f =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    B    Pass the ID of an attribute.

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
  Attributes with data types other than ViReal64 are dim.  If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �-   �  �    Instrument Handle                 �L#����  �    Status                            � � � �  �    Attribute Value                 ���� � ���                                           �� = � � �    Attribute ID                      � =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    A    Pass the ID of an attribute.

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
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   =-   �  �    Instrument Handle                �#����  �    Status                           W � � �  �    Attribute Value                 ���� � ���                                          r = � � �    Attribute ID                     � =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box.
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �-   �  �    Instrument Handle                �#����  �    Status                           % � � �  �    Attribute Value                 ���� � ���                                          ' = � � �    Attribute ID                     ,h =  �  �    Channel Name                           	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be set. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    C    Pass the ID of an attribute.

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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   7�-   �  �    Instrument Handle                8O#����  �    Status                           >� � � �  �    Attribute Value                  @� =  �  �    Channel Name                     E� = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  to the right of the attribute names in the list box.  
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   N*-   �  �    Instrument Handle                N�#����  �    Status                           UD � � �  �    Attribute Value                  W =  �  �    Channel Name                     [� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   c`-   �  �    Instrument Handle                d#����  �    Status                           jz � � �  �    Attribute Value                  l9 =  �  �    Channel Name                     p� = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.  

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviDCPwr_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    &    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

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
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   }�-   �  �    Instrument Handle                ~f#����  �    Status or Required Size          �� � L � �    Attribute Value                  �� =  �  �    Channel Name                     �u =� �  �    Buffer Size                      �l = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �E-   �  �    Instrument Handle                ��#����  �    Status                           �_ � � �  �    Attribute Value                  � =  �  �    Channel Name                     �� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute is channel-based, this control specifies the name of the channel whose attribute is to be retrieved. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �;#����  �    Status                           �� � � �  �    Attribute Value                  �[ =  �  �    Channel Name                     � = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    @    Pass the ID of an attribute.

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
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt32 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �Y-   �  �    Instrument Handle                �#����  �    Status                           �s � � �  �    Attribute Value                  ̣ =  �  �    Channel Name                    ���� � ���                                          �k = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  all IVI attributes or only the attributes of the ViReal64
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ت-   �  �    Instrument Handle                �d#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  all IVI attributes or only the attributes of the ViString
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViString are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                  �G =  �  �    Channel Name                    ���� � ���                                          � = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  all IVI attributes or only the attributes of the ViBoolean
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   Q-   �  �    Instrument Handle                #����  �    Status                           
k � � �  �    Attribute Value                  � =  �  �    Channel Name                    ���� � ���                                          c = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute is channel-based, this parameter specifies the name of the channel on which to check the attribute value. If the attribute is not channel-based, then you set this control to empty string or VI_NULL.

Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value:  ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
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
  all IVI attributes or only the attributes of the ViSession
  type.  If you choose to see all IVI attributes, the data types
  appear to the right of the attribute names in the list box. 
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                a#����  �    Status                           � � � �  �    Attribute Value                  !� =  �  �    Channel Name                    ���� � ���                                          &� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   �    This function initiates output changes that you previously specified.  After you call this function, the power supply waits for the trigger you specify with the IviDCPwr_ConfigureTriggerSource function.  After the power supply detects the trigger, it updates its voltage level and current limit to the values you specify with the IviDCPwr_ConfigureTriggeredVoltageLevel and IviDCPwr_ConfigureTriggeredCurrentLimit functions.

Notes:

(1) This function is part of the IviDCPwrTrigger [TRG] extension group.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   /�#����  �    Status                           6-   �  �    Instrument Handle                  	                  This function aborts all pending output changes.

Notes:

(1) This function is part of the IviDCPwrTrigger [TRG] extension group.

(2) If you call this function after calling the IviDCPwr_Initiate function, the power supply ignores any trigger and does not change the output.

    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   8W#����  �    Status                           >�-   �  �    Instrument Handle                  	              z    This function sends a command to trigger the power supply.  Call this function if you configure the power supply to respond to software triggers.  If the power supply is not configured to respond to software triggers, this function returns the error IVIDCPWR_ERROR_TRIGGER_NOT_SOFTWARE.

Notes:

(1) This function is part of the IviDCPwrSoftwareTrigger [SWT] extension group.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   Am#����  �    Status                           G�-   �  �    Instrument Handle                  	              E    This function returns whether the power supply is in a particular output state.

A constant voltage condition occurs when the output voltage is equal to the value of the IVIDCPWR_ATTR_VOLTAGE_LEVEL attribute and the current is less than or equal to the value of the IVIDCPWR_ATTR_CURRENT_LIMIT attribute.

A constant current condition occurs when the output current is equal to the value of the IVIDCPWR_ATTR_CURRENT_LIMIT attribute and the IVIDCPWR_ATTR_CURRENT_LIMIT_BEHAVIOR attribute is set to IVIDCPWR_VAL_CURRENT_REGULATE.

An unregulated condition occurs when the output voltage is less than the value of the IVIDCPWR_ATTR_VOLTAGE_LEVEL attribute and the current is less than the value of the IVIDCPWR_ATTR_CURRENT_LIMIT attribute.

An over-voltage condition occurs when the output voltage is equal to or greater than the value of the IVIDCPWR_ATTR_OVP_LIMIT attribute and the IVIDCPWR_ATTR_OVP_ENABLED attribute is set to VI_TRUE.

An over-current condition occurs when the output current is equal to or greater than the value of the IVIDCPWR_ATTR_CURRENT_LIMIT attribute and the IVIDCPWR_ATTR_CURRENT_LIMIT_BEHAVIOR attribute is set to IVIDCPWR_VAL_CURRENT_TRIP.  

When either an over-voltage condition or an over-current condition occurs, the power supply's output protection disables the output.  If the power supply is in an over-voltage or over-current state, it does not produce power until the output protection is reset.  The IviDCPwr_ResetOutputProtection function resets the output protection.  Once the output protection is reset, the power supply resumes generating a power signal.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    �    Pass the output state for which you want to query.

Defined Values:
IVIDCPWR_VAL_OUTPUT_CONSTANT_VOLTAGE - Constant Voltage State

IVIDCPWR_VAL_OUTPUT_CONSTANT_CURRENT - Constant Current State

IVIDCPWR_VAL_OUTPUT_UNREGULATED      - Unregulated State

IVIDCPWR_VAL_OUTPUT_OVER_VOLTAGE     - Over-voltage State

IVIDCPWR_VAL_OUTPUT_OVER_CURRENT     - Over-current State

Default Value: IVIDCPWR_VAL_OUTPUT_CONSTANT_VOLTAGE
     �    This parameter returns VI_TRUE if the power supply is currently in the state you specify with the OutputState parameter, and VI_FALSE if it is not.
   ON-   �  �    Instrument Handle                P#����  �    Status                           Vh 3 
 �  �    Channel Name                     ZV 3 � � �    Output State                     \ 3� �  �    In State                               	           ""               �Constant Voltage IVIDCPWR_VAL_OUTPUT_CONSTANT_VOLTAGE Constant Current IVIDCPWR_VAL_OUTPUT_CONSTANT_CURRENT Unregulated IVIDCPWR_VAL_OUTPUT_UNREGULATED Over Voltage IVIDCPWR_VAL_OUTPUT_OVER_VOLTAGE Over Current IVIDCPWR_VAL_OUTPUT_OVER_CURRENT    	            �    This function returns the maximum programmable current limit that the power supply accepts for a particular voltage level on a channel for the output range to which the power supply is currently configured.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the voltage level for which to determine the maximum programmable current limit.  

Units: volts (V).

Default Value: 0.0
     s    This parameter returns the maximum programmable current limit for the voltage level you specify.

Units: amps (A)   _�-   �  �    Instrument Handle                `e#����  �    Status                           f� 3 
 �  �    Channel Name                     j� 3 � �  �    Voltage Level                    k< 3� �  �    Max Current Limit                      	           ""    0.0    	           �    This function returns the maximum programmable voltage level that the power supply accepts for a particular current limit on a channel for the output range to which the power supply is currently configured.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
     �    Pass the current limit for which to determine the maximum programmable voltage level.  

Units: amps (A).

Default Value: 0.0
     t    This parameter returns the maximum programmable voltage level for the current limit you specify.

Units: volts (V)   m�-   �  �    Instrument Handle                n|#����  �    Status                           t� 3 
 �  �    Channel Name                     x� 3 � �  �    Current Limit                    yR 3� �  �    Max Voltage Level                      	           ""    0.0    	           M    This function clears all output-protection conditions on the power supply.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   {U-   �  �    Instrument Handle                |#����  �    Status                           �o 3 
 �  �    Channel Name                           	           ""    �    This function takes a single measurement on the channel you specify.

Notes:

(1) This function is part of the IviDCPwrMeasure [MSR] extension group.
     �    Pass the measurement you want the power supply to take.

Defined Values:
IVIDCPWR_VAL_MEASURE_VOLTAGE - DC voltage IVIDCPWR_VAL_MEASURE_CURRENT - DC current

Default Value: IVIDCPWR_VAL_MEASURE_VOLTAGE    n    Returns the measured value.

If you pass a value of IVIDCPWR_VAL_MEASURE_CURRENT for the measurementType parameter, this parameter returns a value in amps.

If you pass a value of IVIDCPWR_VAL_MEASURE_VOLTAGE for the measurementType parameter, this parameter returns a value in volts.

Units: volts (for voltage measurement)
       amps  (for current measurement)
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

    �    Pass the virtual channel name that you assign to the instrument in the Configuration Utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings.  The instrument-specific channel strings can differ from one instrument to another.  Virtual channel names allow you to use and swap instruments without having to change the channel names in your source code.  You assign a virtual channel name to an instrument-specific channel through the Configuration Utility.  This control accepts virtual channel names you have assigned to the specific instrument you are using.  It also accepts the instrument-specific channel names.

Default Value: ""

Notes:

(1) You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   �� 3 � � �    Measurement Type                 �� 3� �  �    Measurement                      ��-   �  �    Instrument Handle                ��#����  �    Status                           � 3 
 �  �    Channel Name                                  JVoltage IVIDCPWR_VAL_MEASURE_VOLTAGE Current IVIDCPWR_VAL_MEASURE_CURRENT    	               	           ""   &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �# =  �  �    Self Test Result                 �Q = � � ,    Self-Test Message                �#����  �    Status                           �{-   �  �    Instrument Handle                  	           	            	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �h-   �  �    Instrument Handle                  	               P    This function invalidates the cached values of all attributes for the session.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �; = 3 �  �    Instrument Driver Revision       �� =6 �  �    Firmware Revision                �W#����  �    Status                           ķ-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �� =  �  �    Error Code                       � = � � ,    Error Message                    ǧ#����  �    Status                           �-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     $�    Pass the Status parameter that is returned from any of the instrument driver functions.
          
Default Value:  0  (VI_SUCCESS)
          
IviDCPwr Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not software trigger.

IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviDCPwr_error_query.
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
BFFC0012  Invalid response from instrument.     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    Y    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

        The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   �3 =  �  h    Error Code                       �� = � � �    Error Message                    �s#����  �    Status                           ��-   �  �    Instrument Handle                  0    	            	           VI_NULL    `    The function returns the channel string that is in the channel table at an index you specify.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     =    A 1-based index into the channel table.

Default Value:  1
     �    Returns the channel string that is in the channel table at the index you specify.

Do not modify the contents of the channel string.    �    Pass the number of bytes in the ViChar array you specify for the Channel Name parameter.

If the channel name, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Channel Name buffer parameter.

Default Value:  None   �Z-   �  �    Instrument Handle                �#����  �    Status                           � = - �  �    Index                             �, �  �    Channel String                   � � - �  �    Buffer Size                            	           1    	                h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     Z    Returns the C session instrument handle you use to call the specific driver's functions.   	-   �  �    Instrument Handle                	�#����  �    Status                           ' = � �  �    Specific Driver C Handle               	           	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviDCPwr_GetError or IviDCPwr_ClearError.
    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   #����  �    Status                           �-   �  �    Instrument Handle                � =? �  �    BufferSize                       d = Q �  �    Code                             � � Q � �    Description                        	                   	           	           e    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the instrumentHhandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviDCPwr_GetError function, which occurs when a call to IviDCPwr_init or IviDCPwr_InitWithOptions fails.    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, use the IviDCPwr_GetError and IviDCPwr_ClearError functions.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

3FFC0102  Reset not supported.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  A "no listeners" condition was detected.
BFFF0060  This interface is not the controller-in-charge.
BFFF0067  Operation is not supported on this session.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   %�#����  �    Status                           *@-   �  �    Instrument Handle                  	              P    This function returns the interchangeability warnings associated with the IVI session.  It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior.  If the IVIDCPWR_ATTR_SPY attribute is set to VI_FALSE, you use this function to retrieve interchangeability warnings.  If the IVIDCPWR_ATTR_SPY attribute is set to VI_TRUE, you use the NI I/O Trace utility to view interchangeability warnings.

The class driver performs interchangeability checking when the IVIDCPWR_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE and you call one of the following functions:

IviDCPwr_Initiate ()
IviDCPwr_Measure ()

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number for the buffer size, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0 for the buffer size, you can pass VI_NULL for the Interchange Warning buffer parameter.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

Interchangeability checking examines the attributes in a capability group only if you specify a value for at least one attribute within that group.  In general, the class driver generates interchangeability warnings when it encounters one of the following conditions:

(1) An attribute that affects the behavior of the instrument is in a state that you did not specify.

(2) You set a class-defined attribute to an instrument-specific value.

(3) You set the value of an attribute that the class driver defines as read-only.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session.  If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   3�#����  �    Status or Required Size          ;�-   �  �    Instrument Handle                <� = � �  �    Buffer Size                      ?� � Q � �    Interchange Warning                	                   	            �    The specific driver performs interchangeability checking if the IVIDCPWR_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.  This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

   D�-   �  �    Instrument Handle                EF#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviDCPwr_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviDCPwr_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviDCPwr_ClearInterchangeWarnings function.     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

   R�-   �  �    Instrument Handle                S�#����  �    Status                                 	          �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIDCPWR_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

        Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the return buffer, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   _]#����  �    Status or Required Size          g{-   �  �    Instrument Handle                h5 � Q � �    Coercion Record                  k; = � �  �    Buffer Size                        	               	               :    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviDCPwr_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviDCPwr_LockSession returns successfully, no other threads can access the instrument session until you call IviDCPwr_UnlockSession.

Use IviDCPwr_LockSession and IviDCPwr_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviDCPwr_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviDCPwr_LockSession with a call to IviDCPwr_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviDCPwr_LockSession and IviDCPwr_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviDCPwr_LockSession.  This allows you to call IviDCPwr_UnlockSession just once at the end of the function. 
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviDCPwr_LockSession or IviDCPwr_UnlockSession in the same function.

The parameter is an input/output parameter.  IviDCPwr_LockSession and IviDCPwr_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDCPwr_LockSession does not lock the session again.  If the value is VI_FALSE, IviDCPwr_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDCPwr_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviDCPwr_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviDCPwr_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDCPwr_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDCPwr_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDCPwr_LockSession(vi, &haveLock);
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
    IviDCPwr_UnlockSession(vi, &haveLock);
    return error;
}   tf#����  �    Status                           z�-   �  �    Instrument Handle                {� H � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviDCPwr_LockSession.  Refer to IviDCPwr_LockSession for additional information on session locks.
    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviDCPwr_LockSession or IviDCPwr_UnlockSession in the same function.

The parameter is an input/output parameter.  IviDCPwr_LockSession and IviDCPwr_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDCPwr_LockSession does not lock the session again.  If the value is VI_FALSE, IviDCPwr_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDCPwr_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviDCPwr_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviDCPwr_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDCPwr_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDCPwr_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDCPwr_LockSession(vi, &haveLock);
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
    IviDCPwr_UnlockSession(vi, &haveLock);
    return error;
}   ��#����  �    Status                           �&-   �  �    Instrument Handle                �� H � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviDCPwr_close.

(2) After calling IviDCPwr_close, you cannot use the instrument driver again until you call IviDCPwr_init or IviDCPwr_InitWithOptions.

    X    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDCPwr_error_message function.  To obtain additional information about the error condition, call the IviDCPwr_GetError function.  To clear the error information from the driver, call the IviDCPwr_ClearError function.
          
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

     �    The ViSession handle that you obtain from the IviDCPwr_init or IviDCPwr_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �w-   �  �    Instrument Handle                  	            ����         �  *�             K.        init                                                                                                                                    ����         ,1  I             K.        InitWithOptions                                                                                                                         ����         J�  W�             K.        ConfigureOutputEnabled                                                                                                                  ����         X�  g�             K.        ConfigureOutputRange                                                                                                                    ����         ix  wr             K.        ConfigureCurrentLimit                                                                                                                   ����         x�  �             K.        ConfigureOVP                                                                                                                            ����         �J  �w             K.        ConfigureVoltageLevel                                                                                                                   ����         �h  �R             K.        ConfigureTriggerSource                                                                                                                  ����         ��  ��             K.        ConfigureTriggeredVoltageLevel                                                                                                          ����         ��  �"             K.        ConfigureTriggeredCurrentLimit                                                                                                          ����         �  �#             K.        SetAttributeViInt32                                                                                                                     ����         �  ��             K.        SetAttributeViReal64                                                                                                                    ����         �i x             K.        SetAttributeViString                                                                                                                    ����         1%             K.        SetAttributeViBoolean                                                                                                                   ����        2� J�             K.        SetAttributeViSession                                                                                                                   ����        Lm `e             K.        GetAttributeViInt32                                                                                                                     ����        a� u�             K.        GetAttributeViReal64                                                                                                                    ����        v� �             K.        GetAttributeViString                                                                                                                    ����        �� ��             K.        GetAttributeViBoolean                                                                                                                   ����        �� ��             K.        GetAttributeViSession                                                                                                                   ����        �� ֳ             K.        CheckAttributeViInt32                                                                                                                   ����        �N �             K.        CheckAttributeViReal64                                                                                                                  ����        �� Y             K.        CheckAttributeViString                                                                                                                  ����        � �             K.        CheckAttributeViBoolean                                                                                                                 ����        J ,             K.        CheckAttributeViSession                                                                                                                 ����        -� 6�             K.        Initiate                                                                                                                                ����        78 ?q             K.        Abort                                                                                                                                   ����        ?� H�             K.        SendSoftwareTrigger                                                                                                                     ����        I \�             K.        QueryOutputState                                                                                                                        ����        ^� k�             K.        QueryMaxCurrentLimit                                                                                                                    ����        l� y�             K.        QueryMaxVoltageLevel                                                                                                                    ����        {  �]             K.        ResetOutputProtection                                                                                                                   ����        � �             K.        Measure                                                                                                                                 ����        �� ��             K.        reset                                                                                                                                   ����        �I �G             K.        ResetWithDefaults                                                                                                                       ����        �� �5             K.        self_test                                                                                                                               ����        �1 �"             K.        Disable                                                                                                                                 ����        �� �Y             K.        InvalidateAllAttributes                                                                                                                 ����        �� �q             K.        revision_query                                                                                                                          ����        �m ��             K.        error_query                                                                                                                             ����        Ͻ ��             K.        error_message                                                                                                                           ����        �� o             K.        GetChannelName                                                                                                                          ����        � �             K.        GetSpecificDriverCHandle                                                                                                                ����        D  �             K.        GetError                                                                                                                                ����        "( *�             K.        ClearError                                                                                                                              ����        +t B�             K.        GetNextInterchangeWarning                                                                                                               ����        C� K�             K.        ClearInterchangeWarnings                                                                                                                ����        L  Z             K.        ResetInterchangeCheck                                                                                                                   ����        Z� n0             K.        GetNextCoercionRecord                                                                                                                   ����        o$ �P             K.        LockSession                                                                                                                             ����        � ��             K.        UnlockSession                                                                                                                           ����        �k �1             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             'Configuration                                                                       Output                                                                               �Configure Output Enabled                                                             �Configure Output Range                                                               �Configure Current Limit                                                              �Configure OVP                                                                        �Configure Voltage Level                                                             [Triggering                                                                           �Configure Trigger Source [TRG]                                                       �Configure Triggered Volt [TRG]                                                       �Configure Triggered Curr [TRG]                                                      �Set/Get/Check Attribute                                                             Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Action/Status                                                                        �Initiate [TRG]                                                                       �Abort [TRG]                                                                          �Send Software Trigger [SWT]                                                          �Query Output State                                                                   �Query Max Current Limit                                                              �Query Max Voltage Level                                                              �Reset Output Protection                                                              �Measure [MSR]                                                                       Utility                                                                              �Reset                                                                                �Reset With Defaults                                                                  �Self-Test                                                                            �Disable                                                                              �Invalidate All Attributes                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Get Channel Name                                                                     �Get Specific Driver C Handle                                                        bError Info                                                                           �Get Error                                                                            �Clear Error                                                                         �Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             Coercion Info                                                                        �Get Next Coercion Record                                                            ULocking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           