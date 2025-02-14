s��   	     t�   S B�  2P   �   ����                                IviCounter                      IviCounter Class Driver (NI)                _VI_FUNC                                                  � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr     	�  ViChar []   �    This instrument driver contains programming support for the IVI Counter.  This driver has all the functions that IVI and VXIplug&play require.  

Note:  This driver requires the VISA and IVI libraries.       �    This class contains functions and sub-classes that configure the instrument.  The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     M    This class contains functions that acquire trace data from the instrument.
     O    This class contains functions that transfer data to and from the instrument.
    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     ?    This class contains functions that retrieve coercion records.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    K    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviCounter_LockSession and IviCounter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.

    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleCounter"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.
        Specify whether you want the instrument driver to perform an ID Query.

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviCounter_LockSession and IviCounter_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0101  ID Query not supported.
3FFC0102  Reset not supported.

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFA0000  Cannot load IVI engine.
BFFA0001  Instrument error. Call IviCounter_error_query.
BFFA000C  Invalid attribute.
BFFA000D  Attribute is not writable.
BFFA000E  Attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0054  Bad channel name in Channel List.

BFFC0011  Instrument returned invalid response to ID Query.

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
    � 9   �  �    Logical Name                      � 9 �       ID Query                          � 9� �       Reset Device                      h#  �  �    Instrument Handle                 *#����  �    Status                             "SampleCounter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          ]    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVICOUNTER_ATTR_RANGE_CHECK         
    IVICOUNTER_ATTR_QUERY_INSTRUMENT_STATUS  
    IVICOUNTER_ATTR_CACHE               
    IVICOUNTER_ATTR_SIMULATE            
    IVICOUNTER_ATTR_RECORD_COERCIONS   

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviCounter_LockSession and IviCounter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleCounter"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive.  If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.
        Specify whether you want the instrument driver to perform an ID Query.

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviCounter_LockSession and IviCounter_UnlockSession to protect sections of code that require exclusive access to the resource.

    	�    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0101  ID Query not supported.
3FFC0102  Reset not supported.

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFA0000  Cannot load IVI engine.
BFFA0001  Instrument error. Call IviCounter_error_query.
BFFA000C  Invalid attribute.
BFFA000D  Attribute is not writable.
BFFA000E  Attribute is not readable.
BFFA000F  Invalid parameter.
BFFA0010  Invalid value.
BFFA0012  Attribute not supported.
BFFA0013  Value not supported.
BFFA0014  Invalid type.
BFFA0015  Types do not match.
BFFA0016  Attribute already has a value waiting to be updated.
BFFA0018  Not a valid configuration.
BFFA0019  Requested item does not exist or value not available.
BFFA001A  Requested attribute value not known.
BFFA001B  No range table.
BFFA001C  Range table is invalid.
BFFA001F  No channel table has been built for the session.
BFFA0020  Channel name specified is not valid.
BFFA0044  Channel name required.
BFFA0045  Channel name not allowed.
BFFA0046  Attribute not valid for channel.
BFFA0047  Attribute must be channel based.
BFFA0049  Missing option name (nothing before the '=').
BFFA004A  Missing option value (nothing after the '=').
BFFA004B  Bad option name.
BFFA004C  Bad option value.
BFFA0054  Bad channel name in Channel List

BFFC0011  Instrument returned invalid response to ID Query.

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
    }    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVICOUNTER_ATTR_RANGE_CHECK
QueryInstrStatus  IVICOUNTER_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVICOUNTER_ATTR_CACHE   
Simulate          IVICOUNTER_ATTR_SIMULATE  
RecordCoercions   IVICOUNTER_ATTR_RECORD_COERCIONS

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set.  To set multiple attributes, separate their assignments with a comma.  

If you pass NULL or an empty string for this parameter, the session uses the default values for the attributes.   You can override the default values by assigning a value explicitly in a string you pass for this parameter.  You do not have to specify all of the attributes and may leave any of them out.  If you do not specify one of the attributes, its default value will be used.  

The default values for the attributes are shown below:

    Attribute Name     Default Value
    ----------------   -------------
    RangeCheck         VI_TRUE
    QueryInstrStatus   VI_FALSE
    Cache              VI_TRUE
    Simulate           VI_FALSE
    RecordCoercions    VI_FALSE
    

The following are the valid values for ViBoolean attributes:

    True:     1, True, or VI_TRUE
    False:    0, False, or VI_FALSE


Default Value:
       "Simulate=0,RangeCheck=1,QueryInstrStatus=1,Cache=1"
    *� 9   �  �    Resource Name                     .� 9 �       ID Query                          0� 9� �       Reset Device                      1�#  �  �    Instrument Handle                 4R#����  �    Status                            =� �  � �    Option String                      "SampleCounter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=1,Cache=1"    �    This function configures the IVICOUNTER_ATTR_IMPEDANCE, IVICOUNTER_ATTR_COUPLING, and IVICOUNTER_ATTR_ATTENUATION attributes of the counter channel.      �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies the name of the channel you want to configure.

Pass the virtual channel name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings, which can differ from one instrument to another. With virtual channel names, you can use and swap instruments without having to change the channel names in your source code. Assign a virtual channel name to an instrument-specific channel through the IVI Configuration utility. This parameter accepts virtual channel names you have assigned to the specific instrument you are using and also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.        Specifies the impedance you want the counter to use to couple the input signal for the channel. The driver uses this value to set the IVICOUNTER_ATTR_IMPEDANCE attribute. Refer to the attribute description for more information.

Units: ohm

Default Value: 1000000.0    6    Specifies how you want the counter to couple the input signal for the channel. The driver uses this value to set the IVICOUNTER_ATTR_COUPLING attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_AC  -  AC
IVICOUNTER_VAL_DC  -  DC

Default Value: IVICOUNTER_VAL_AC     �    Specifies the attenuation you want the counter to use for the channel. The driver uses this value to set the IVICOUNTER_ATTR_ATTENUATION attribute. Refer to the attribute description for more information.

Units: dB

Default Value: 1.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    F�-   �  �    Instrument Handle                 G� -  �  �    Channel                           K� - � �  �    Impedance                         L� -� � �    Coupling                          N �  �  �    Attenuation                       N�#����  �    Status                                 ""    
1000000.0               *AC IVICOUNTER_VAL_AC DC IVICOUNTER_VAL_DC    1.0    	           ~    This function configures the IVICOUNTER_ATTR_CHANNEL_LEVEL and IVICOUNTER_ATTR_CHANNEL_HYSTERESIS attributes for a channel.      �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies the name of the channel you want to configure.

Pass the virtual channel name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings, which can differ from one instrument to another. With virtual channel names, you can use and swap instruments without having to change the channel names in your source code. Assign a virtual channel name to an instrument-specific channel through the IVI Configuration utility. This parameter accepts virtual channel names you have assigned to the specific instrument you are using and also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the trigger level you want the counter to use for the channel. The driver uses this value to set the IVICOUNTER_ATTR_CHANNEL_LEVEL attribute. Refer to the attribute description for more information.

Units: volt

Default Value: 0.0     �    Specifies the hysteresis you want the counter to use for the channel. The driver uses this value to set the IVICOUNTER_ATTR_CHANNEL_HYSTERESIS attribute. Refer to the attribute description for more information.

Units: volt

Default Value: 0.65    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    X -   �  �    Instrument Handle                 X� -  �  �    Channel                           \� - � �  �    Level                             ]� -� �  �    Hysteresis                        ^�#����  �    Status                                 ""    0.0    0.65    	           U    This function configures the IVICOUNTER_ATTR_CHANNEL_SLOPE attribute for a channel.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies the name of the channel you want to configure.

Pass the virtual channel name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings, which can differ from one instrument to another. With virtual channel names, you can use and swap instruments without having to change the channel names in your source code. Assign a virtual channel name to an instrument-specific channel through the IVI Configuration utility. This parameter accepts virtual channel names you have assigned to the specific instrument you are using and also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    K    Specifies the slope you want the counter to use for the channel. The driver uses this value to set the IVICOUNTER_ATTR_CHANNEL_SLOPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_POSITIVE  -  Positive
IVICOUNTER_VAL_NEGATIVE  -  Negative

Default Value: IVICOUNTER_VAL_POSITIVE    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    gc-   �  �    Instrument Handle                 h  -  �  �    Channel                           l! -� � �    Slope                             mt#����  �    Status                                 ""               BPositive IVICOUNTER_VAL_POSITIVE Negative IVICOUNTER_VAL_NEGATIVE    	           V    This function configures the IVICOUNTER_ATTR_FILTER_ENABLED attribute for a channel.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies the name of the channel you want to configure.

Pass the virtual channel name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings, which can differ from one instrument to another. With virtual channel names, you can use and swap instruments without having to change the channel names in your source code. Assign a virtual channel name to an instrument-specific channel through the IVI Configuration utility. This parameter accepts virtual channel names you have assigned to the specific instrument you are using and also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.        Specifies if you want to enable the counter filter for the channel. The driver uses this value to set the IVICOUNTER_ATTR_FILTER_ENABLED attribute. Refer to the attribute description for more information.

Valid Values:
VI_TRUE  - Enable
VI_FALSE - Disable

Default Value: VI_FALSE    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    v-   �  �    Instrument Handle                 v� -  �  �    Channel                           z� -� �  �    Filter Enabled                    {�#����  �    Status                                 ""    True VI_TRUE False VI_FALSE    	          �    This function configures the instrument to determine the best estimate and resolution for the selected channel.

This function sets IVICOUNTER_ATTR_AUTO_FREQUENCY_ESTIMATE and IVICOUNTER_ATTR_AUTO_FREQUENCY_RESOLUTION to true. When the IVICOUNTER_ATTR_AUTO_FREQUENCY_ESTIMATE or IVICOUNTER_ATTR_AUTO_FREQUENCY_RESOLUTION are true, the IVICOUNTER_ATTR_FREQUENCY_APERTURE_TIME attribute can be read to determine the aperture time selected by the driver.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the frequency is measured. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_CHANNEL attribute.

Default Value:  ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ��-   �  �    Instrument Handle                 �� - � �  �    Channel                           ��#����  �    Status                                 ""    	           �    This function configures the IVICOUNTER_ATTR_FREQUENCY_ESTIMATE and IVICOUNTER_ATTR_FREQUENCY_RESOLUTION attributes for a frequency measurement for a particular channel.      �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the frequency is measured. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_CHANNEL attribute.

Default Value:  ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated frequency. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_ESTIMATE attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 300000000.0    E    Specifies the resolution of the frequency measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RESOLUTION attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 1.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �-   �  �    Instrument Handle                 �� -  �  �    Channel                           �� - � �  �    Estimate                          �� -� �  �    Resolution                        �#����  �    Status                                 ""    300000000.0    1.0    	           X    This function configures a frequency measurement based on the specified aperture time.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the frequency is measured. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the aperture time of the frequency measurement. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_APERTURE_TIME attribute. Refer to the attribute description for more information.

Unit: seconds

Default Value: 0.01    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ��-   �  �    Instrument Handle                 �[ -  �  �    Channel                           �r -� �  �    Aperture Time                     �k#����  �    Status                                 ""    0.01    	           �    This function configures the IVICOUNTER_ATTR_PERIOD_ESTIMATE and IVICOUNTER_ATTR_PERIOD_RESOLUTION attributes for a period measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    	    Specifies the channel name on which the period is measured. The driver uses this value to set the IVICOUNTER_ATTR_PERIOD_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated period. The driver uses this value to set the IVICOUNTER_ATTR_PERIOD_ESTIMATE attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.1    D    Specifies the resolution of the period measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_PERIOD_RESOLUTION attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 1.0E-9    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ��-   �  �    Instrument Handle                 �� -  �  �    Channel                           �� - � �  �    Estimate                          �� -� �  �    Resolution                        ��#����  �    Status                                 ""    0.1    1.0E-9    	           U    This function configures a period measurement based on the specified aperture time.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the period is measured. The driver uses this value to set the IVICOUNTER_ATTR_PERIOD_CHANNEL attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the aperture time of the period measurement. The driver uses this value to set the IVICOUNTER_ATTR_PERIOD_APERTURE_TIME attribute. Refer to the attribute description for more information.

Unit: seconds

Default Value: 0.01    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �n-   �  �    Instrument Handle                 �+ -  �  �    Channel                           �; -� �  �    Aperture Time                     �.#����  �    Status                                 ""    0.01    	           �    This function configures the IVICOUNTER_ATTR_PULSE_WIDTH_ESTIMATE and IVICOUNTER_ATTR_PULSE_WIDTH_RESOLUTION attributes for a pulse width measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the pulse width is measured. The driver uses this value to set the IVICOUNTER_ATTR_PULSE_WIDTH_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated pulse width. The driver uses this value to set the IVICOUNTER_ATTR_PULSE_WIDTH_ESTIMATE attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.01    O    Specifies the resolution of the pulse width measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_PULSE_WIDTH_RESOLUTION attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 1.0E-10    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ��-   �  �    Instrument Handle                 �~ -  �  �    Channel                           �� - � �  �    Estimate                          �{ -� �  �    Resolution                        ��#����  �    Status                                 ""    0.01    1.0E-10    	           �    This function configures the IVICOUNTER_ATTR_DUTY_CYCLE_FREQUENCY_ESTIMATE and IVICOUNTER_ATTR_DUTY_CYCLE_RESOLUTION attributes for a duty cycle measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the duty cycle is measured. The driver uses this value to set the IVICOUNTER_ATTR_DUTY_CYCLE_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated frequency. The driver uses this value to set the IVICOUNTER_ATTR_DUTY_CYCLE_FREQUENCY_ESTIMATE attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 300000000.0    G    Specifies the resolution of the duty cycle measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_DUTY_CYCLE_RESOLUTION attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 1.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ̬-   �  �    Instrument Handle                 �i -  �  �    Channel                           ΂ - � �  �    Frequency Estimate                �p -� �  �    Resolution                        п#����  �    Status                                 ""    300000000.0    1.0    	          �    This function configures an edge time measurement:

- The IVICOUNTER_ATTR_EDGE_TIME_ESTIMATE and IVICOUNTER_ATTR_EDGE_TIME_RESOLUTION attributes are set to the specified values
- The edge time reference type is set to percentage
- The edge time low reference and edge time high reference values are set to 10% and 90%, respectively
- If the channel slope is positive, a rise-time measurement is performed; if the channel slope is negative, a fall-time measurement is performed     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the edge time is measured. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated edge time. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_ESTIMATE attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.1    H    Specifies the resolution of the edge time measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_RESOLUTION attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.01    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    ��-   �  �    Instrument Handle                 ۘ -  �  �    Channel                           ܯ - � �  �    Estimate                          ݌ -� �  �    Resolution                        ��#����  �    Status                                 ""    0.1    0.01    	          �    This function configures the IVICOUNTER_ATTR_EDGE_TIME_REFERENCE_TYPE, IVICOUNTER_ATTR_EDGE_TIME_ESTIMATE, IVICOUNTER_ATTR_EDGE_TIME_RESOLUTION, IVICOUNTER_ATTR_EDGE_TIME_HIGH_REFERENCE, and IVICOUNTER_ATTR_EDGE_TIME_LOW_REFERENCE attributes for an edge time measurement. 

If the channel slope is positive, a rise-time measurement is performed; if the channel slope is negative, a fall-time measurement is performed.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name on which the edge time is measured. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_CHANNEL attribute. 

Default Value:  ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
    [    Specifies the reference type. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_REFERENCE_TYPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_VOLTAGE_REFERENCE_TYPE  -  Voltage
IVICOUNTER_VAL_PERCENT_REFERENCE_TYPE  -  Percent

Default Value: IVICOUNTER_VAL_VOLTAGE_REFERENCE_TYPE     �    Specifies the estimated edge time. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_ESTIMATE attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 1.0E10    K    Specifies the resolution of the edge time measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_RESOLUTION attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 1.0E-10     �    Specifies the high reference level for the edge time. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_HIGH_REFERENCE attribute. Refer to the attribute description for more information.

Units: volt or percent

Default Value: 0.1     �    Specifies the low reference level for the edge time. The driver uses this value to set the IVICOUNTER_ATTR_EDGE_TIME_LOW_REFERENCE attribute. Refer to the attribute description for more information.

Units: volt or percent

Default Value: 0.9    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �-   �  �    Instrument Handle                 �s -  �  �    Channel                           � - � � �    Reference Type                    �� -� �  �    Estimate                          �� �  �  �    Resolution                        �" � � �  �    High Reference                    �  �� �  �    Low Reference                     �#����  �    Status                                 "1"               \Voltage IVICOUNTER_VAL_VOLTAGE_REFERENCE_TYPE Percent IVICOUNTER_VAL_PERCENT_REFERENCE_TYPE    1.0E10    1.0E-10    0.1    0.9    	           �    This function configures the IVICOUNTER_ATTR_FREQUENCY_RATIO_ESTIMATE and IVICOUNTER_ATTR_FREQUENCY_RATIO_RESOLUTION attributes and specifies the numerator and denominator channels for a frequency ratio measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    9    Specifies the numerator channel name on which the frequency ratio is measured. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RATIO_NUMERATOR_CHANNEL attribute. 

Default Value: ""

Note: You can specify the numerator channel name as a string variable or as a literal enclosed in double quotes.    ?    Specifies the denominator channel name on which the frequency ratio is measured. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RATIO_DENOMINATOR_CHANNEL attribute. 

Default Value: ""

Note: You can specify the denominator channel name as a string variable or as a literal enclosed in double quotes.        Specifies the estimated frequency for the numerator of the frequency ratio. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RATIO_NUMERATOR_FREQUENCY_ESTIMATE attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 1.0E8     �    Specifies the estimated frequency ratio measurement. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RATIO_ESTIMATE attribute. Refer to the attribute description for more information.

Default Value: 1.0    D    Specifies the resolution of the frequency ratio measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_FREQUENCY_RATIO_RESOLUTION attribute. Refer to the attribute description for more information.

Default Value: 0.01    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �K-   �  �    Instrument Handle                 � -  �  �    Numerator Channel                 �I - � �  �    Denominator Channel               �� -� �  �    Numerator Frequency Estimate      �� �  �  �    Estimate                          �� � � �  �    Resolution                        �#����  �    Status                                 ""    ""    1.0E8    1.0    0.01    	           �    This function configures the IVICOUNTER_ATTR_TIME_INTERVAL_ESTIMATE and IVICOUNTER_ATTR_TIME_INTERVAL_RESOLUTION attributes and specifies the start and stop channels for a time interval measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    &    Specifies the channel name that starts the time interval measurement. The driver uses this value to set the IVICOUNTER_ATTR_TIME_INTERVAL_START_CHANNEL attribute. 

Default Value: ""

Note: You can specify the start channel name as a string variable or as a literal enclosed in double quotes.    "    Specifies the channel name that stops the time interval measurement. The driver uses this value to set the IVICOUNTER_ATTR_TIME_INTERVAL_STOP_CHANNEL attribute.

Default Value: ""

Note: You can specify the stop channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated time interval. The driver uses this value to set the IVICOUNTER_ATTR_TIME_INTERVAL_ESTIMATE attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.1    R    Specifies the resolution of the time interval measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_TIME_INTERVAL_RESOLUTION attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 1.0E-9    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   
Y-   �  �    Instrument Handle                 -  �  �    Start Channel                    D - � �  �    Stop Channel                     n -� �  �    Estimate                         S �  �  �    Resolution                       �#����  �    Status                                 ""    ""    0.1    1.0E-9    	           �    This function configures the IVICOUNTER_ATTR_PHASE_FREQUENCY_ESTIMATE and IVICOUNTER_ATTR_PHASE_RESOLUTION attributes and specifies the input and reference channels for a phase measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the input channel name on which the phase is measured. The driver uses this value to set the IVICOUNTER_ATTR_PHASE_INPUT_CHANNEL attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    (    Specifies the channel name on which the phase measurement is referenced. The driver uses this value to set the IVICOUNTER_ATTR_PHASE_REFERENCE_CHANNEL attribute.

Default Value: ""

Note: You can specify the reference channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the estimated phase. The driver uses this value to set the IVICOUNTER_ATTR_PHASE_FREQUENCY_ESTIMATE attribute. Refer to the attribute description for more information.

Unit: hertz

Default Value: 300000000.0    <    Specifies the resolution of the phase measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_PHASE_RESOLUTION attribute. Refer to the attribute description for more information.

Unit: hertz

Default Value: 1.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �-   �  �    Instrument Handle                � -  �  �    Input Channel                    � - � �  �    Reference Channel                � -� �  �    Frequency Estimate               � �  �  �    Resolution                       #����  �    Status                                 ""    ""    300000000.0    1.0    	          I    This function configures the counter for a continuous totalize measurement.  Start continuous totalize clears the count and starts the accumulation of counts.  Stop continuous totalize stops the accumulation of counts. You can use fetch continuous totalize if the count is accumulating or stopped to retrieve the current count.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the input channel name. The driver uses this value to set the IVICOUNTER_ATTR_CONTINUOUS_TOTALIZE_CHANNEL attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   '�-   �  �    Instrument Handle                (� - � �  �    Channel                          )�#����  �    Status                                 ""    	           �    This function specifies the channel name to use for the gate source and configures the IVICOUNTER_ATTR_GATED_TOTALIZE_GATE_SLOPE attribute for a gated totalize measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name that will be counted. The driver uses this value to set the IVICOUNTER_ATTR_GATED_TOTALIZE_CHANNEL attribute. 

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    U    Specifies the channel name that will gate the counted channel. The driver uses this value to set the IVICOUNTER_ATTR_GATED_TOTALIZE_GATE_SOURCE attribute. Refer to the attribute description for more information. 

Default Value: ""

Note: You can specify the gate source name as a string variable or as a literal enclosed in double quotes.    F    Specifies the gate slope you want to configure. The driver uses this value to set the IVICOUNTER_ATTR_GATED_TOTALIZE_GATE_SLOPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_POSITIVE  -  Positive
IVICOUNTER_VAL_NEGATIVE  -  Negative

Default Value: IVICOUNTER_VAL_POSITIVE    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   1�-   �  �    Instrument Handle                2� -  �  �    Channel                          3� - � �  �    Gate Source                      5% -� � �    Gate Slope                       6s#����  �    Status                                 ""    ""               BPositive IVICOUNTER_VAL_POSITIVE Negative IVICOUNTER_VAL_NEGATIVE    	           �    This function sets the measurement function to IVICOUNTER_VAL_TIMED_TOTALIZE and configures the IVICOUNTER_ATTR_TIMED_TOTALIZE_GATE_TIME attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel name that will be counted. The driver uses this value to set the IVICOUNTER_ATTR_TIMED_TOTALIZE_CHANNEL attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the gate time that will gate the counter channel. The driver uses this value to set the IVICOUNTER_ATTR_TIMED_TOTALIZE_GATE_TIME attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.1    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   ?�-   �  �    Instrument Handle                @D -  �  �    Channel                          AQ -� �  �    Gate Time                        BM#����  �    Status                                 ""    0.1    	           @    This function configures the start arm for armed measurements.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    ^    Specifies the start arm type for armed measurements. The driver uses this value to set the IVICOUNTER_ATTR_START_ARM_TYPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE  -  Immediate
IVICOUNTER_VAL_EXTERNAL_ARM_TYPE  -  External

Default Value: IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   J�-   �  �    Instrument Handle                KD - � � �    Type                             L�#����  �    Status                                            VImmediate IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE External IVICOUNTER_VAL_EXTERNAL_ARM_TYPE    	           �    This function specifies the external start arm source and configures the IVICOUNTER_ATTR_EXTERNAL_START_ARM_LEVEL, IVICOUNTER_ATTR_EXTERNAL_START_ARM_SLOPE, and IVICOUNTER_ATTR_EXTERNAL_START_ARM_DELAY attributes.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the external start arm source for armed measurements. The driver uses this value to set the  IVICOUNTER_ATTR_EXTERNAL_START_ARM_SOURCE attribute. 

Default Value: ""        Specifies the level you want the counter to use for the external start arm. The driver uses this value to set the  IVICOUNTER_ATTR_EXTERNAL_START_ARM_LEVEL attribute. Refer to the attribute description for more information.

Units: volt

Default Value: 0.0    =    Specifies the external start arm slope. The driver uses this value to set the IVICOUNTER_ATTR_EXTERNAL_START_ARM_SLOPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_POSITIVE  -  Positive
IVICOUNTER_VAL_NEGATIVE  -  Negative

Default Value: IVICOUNTER_VAL_POSITIVE     �    Specifies the external start arm delay. The driver uses this value to set the  IVICOUNTER_ATTR_EXTERNAL_START_ARM_DELAY attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   U�-   �  �    Instrument Handle                V[ -  �  �    Source                           W - � �  �    Level                            X -� � �    Slope                            Yc �  �  �    Delay                            ZL#����  �    Status                                 ""    0.0               BPositive IVICOUNTER_VAL_POSITIVE Negative IVICOUNTER_VAL_NEGATIVE    0.0    	           ?    This function configures the stop arm for armed measurements.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    \    Specifies the stop arm type for armed measurements. The driver uses this value to set the IVICOUNTER_ATTR_STOP_ARM_TYPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE  -  Immediate
IVICOUNTER_VAL_EXTERNAL_ARM_TYPE  -  External

Default Value: IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   cG-   �  �    Instrument Handle                d - � � �    Type                             eh#����  �    Status                                            VImmediate IVICOUNTER_VAL_IMMEDIATE_ARM_TYPE External IVICOUNTER_VAL_EXTERNAL_ARM_TYPE    	           �    This function specifies the external stop arm source and configures the IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_LEVEL, IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_SLOPE, and IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_DELAY attributes.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the external stop arm source for armed measurements. The driver uses this value to set the  IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_SOURCE attribute. 

Default Value: ""     �    Specifies the level you want the counter to use for the external stop arm. The driver uses this value to set the IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_LEVEL attribute. Refer to the attribute description for more information.

Units: volt

Default Value: 0.0    ;    Specifies the external stop arm slope. The driver uses this value to set the IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_SLOPE attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_POSITIVE  -  Positive
IVICOUNTER_VAL_NEGATIVE  -  Negative

Default Value: IVICOUNTER_VAL_POSITIVE     �    Specifies the external stop arm delay. The driver uses this value to set the IVICOUNTER_ATTR_EXTERNAL_STOP_ARM_DELAY attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   nX-   �  �    Instrument Handle                o -  �  �    Source                           o� - � �  �    Level                            p� -� � �    Slope                            r �  �  �    Delay                            r�#����  �    Status                                 ""    0.0               BPositive IVICOUNTER_VAL_POSITIVE Negative IVICOUNTER_VAL_NEGATIVE    0.0    	           W    This function sets the bandpass filter minimum and maximum frequencies for a channel.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Specifies the name of the channel you want to configure.

Pass the virtual channel name that you assign to the instrument in the IVI Configuration utility.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Virtual channel names are aliases for instrument-specific channel strings, which can differ from one instrument to another. With virtual channel names, you can use and swap instruments without having to change the channel names in your source code. Assign a virtual channel name to an instrument-specific channel through the IVI Configuration utility. This parameter accepts virtual channel names you have assigned to the specific instrument you are using and also accepts the instrument-specific channel names.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the minimum filter frequency. The driver uses this value to set the IVICOUNTER_ATTR_FILTER_MINIMUM_FREQUENCY attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 10.0     �    Specifies the maximum filter frequency. The driver uses this value to set the IVICOUNTER_ATTR_FILTER_MAXIMUM_FREQUENCY attribute. Refer to the attribute description for more information.

Units: hertz

Default Value: 10.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   |-   �  �    Instrument Handle                |� -  �  �    Channel                          �� - � �  �    Minimum Frequency                �� -� �  �    Maximum Frequency                ��#����  �    Status                                 ""    10.0    10.0    	           K    This function configures the time interval stop holdoff time, in seconds.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None     �    Specifies the  value of the stop holdoff, in seconds. The driver uses this value to set the IVICOUNTER_ATTR_TIME_INTERVAL_STOP_HOLDOFF attribute. Refer to the attribute description for more information.

Units: seconds

Default Value: 0.0    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �-   �  �    Instrument Handle                �� - � �  �    Time                             ��#����  �    Status                                 0.0    	           w    This function configures the voltage function, the estimate, and the resolution attributes for a voltage measurement.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None        Specifies the channel on which the voltage is measured. The driver uses this value to set the IVICOUNTER_ATTR_VOLTAGE_CHANNEL attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    V    Specifies the voltage function. You can specify DC voltage, maximum voltage, minimum voltage, RMS voltage, and peak-to-peak voltage. The driver uses this value to set the IVICOUNTER_ATTR_MEASUREMENT_FUNCTION attribute. Refer to the attribute description for more information.

Valid Values:
IVICOUNTER_VAL_DC_VOLTAGE        -   DC Voltage
IVICOUNTER_VAL_MAXIMUM_VOLTAGE   -   Maximum Voltage 
IVICOUNTER_VAL_MINIMUM_VOLTAGE   -   Minimum Voltage
IVICOUNTER_VAL_RMS_VOLTAGE       -   RMS Voltage
IVICOUNTER_VAL_PEAK_TO_PEAK_VOLTAGE -  Peak-to-Peak Voltage

Default Value: IVICOUNTER_VAL_DC_VOLTAGE     �    Specifies the estimated voltage. The driver uses this value to set the IVICOUNTER_ATTR_VOLTAGE_ESTIMATE attribute. Refer to the attribute description for more information.

Units: volts

Default Value: 5.0    B    Specifies the resolution of the voltage measurement. The resolution is the quantization size, or the smallest delta value, that can be detected. The driver uses this value to set the IVICOUNTER_ATTR_VOLTAGE_RESOLUTION attribute. Refer to the attribute description for more information.

Units: volts

Default Value: 0.01    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �	-   �  �    Instrument Handle                �� -  �  �    Channel                          �� - � � �    Function                         �1 -� �  �    Estimate                         � �  �  �    Resolution                       �R#����  �    Status                                 ""               �DC Voltage IVICOUNTER_VAL_DC_VOLTAGE Maximum Voltage IVICOUNTER_VAL_MAXIMUM_VOLTAGE Minimum Voltage IVICOUNTER_VAL_MINIMUM_VOLTAGE RMS Voltage IVICOUNTER_VAL_RMS_VOLTAGE Peak-to-Peak Voltage IVICOUNTER_VAL_PEAK_TO_PEAK_VOLTAGE    5.0    0.01    	          �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   �{-   �  �    Instrument Handle                �9#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     � =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   �h-   �  �    Instrument Handle                �&#����  �    Status                           ɤ � � �  �    Attribute Value                 ���� � ���                                          ˿ = � � �    Attribute ID                     �	 =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   �T-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     �� =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   �@-   �  �    Instrument Handle                ��#����  �    Status                           �| � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                      � =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
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
   	.-   �  �    Instrument Handle                	�#����  �    Status                           j � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name         a = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
   -   �  �    Instrument Handle                �#����  �    Status                           &@ � � �  �    Attribute Value                  '� =  �  �    Repeated Capability Name         )� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""    �    Pass the ID of an attribute.

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
   1u-   �  �    Instrument Handle                23#����  �    Status                           9� � � �  �    Attribute Value                  ;p =  �  �    Repeated Capability Name         =K = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.  

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviCounter_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    	0    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
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
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value: 512    �    Pass the ID of an attribute.

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
   I�-   �  �    Instrument Handle                J�#����  �    Status or Required Size          S� � L � �    Attribute Value                  X! =  �  �    Repeated Capability Name         Y� =� �  �    Buffer Size                      \� = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""    �    Pass the ID of an attribute.

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
   d�-   �  �    Instrument Handle                e�#����  �    Status                           m � � �  �    Attribute Value                  n� =  �  �    Repeated Capability Name         p� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
  Attributes with data types other than ViSession are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   xA-   �  �    Instrument Handle                x�#����  �    Status                           �} � � �  �    Attribute Value                  �= =  �  �    Repeated Capability Name         � = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
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
   �T-   �  �    Instrument Handle                �#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
   ��-   �  �    Instrument Handle                ��#����  �    Status                           � � � �  �    Attribute Value                  �G =  �  �    Repeated Capability Name        ���� � ���                                          �# = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
   �d-   �  �    Instrument Handle                �"#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
   ��-   �  �    Instrument Handle                Ŭ#����  �    Status                           �* � � �  �    Attribute Value                  �Z =  �  �    Repeated Capability Name        ���� � ���                                          �6 = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
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

Default Value: none    �    If the attribute applies to a repeated capability such as a trace, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

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
   �z-   �  �    Instrument Handle                �8#����  �    Status                           � � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    �    This function clears the count and starts the counter for a continuous totalize measurement.

To obtain the measurement, first configure the
channel using IviCounter_ConfigureContinuousTotalize.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �u-   �  �    Instrument Handle                �2#����  �    Status                                 	           �    This function stops the accumulation of counts for a continuous totalize measurement.

To obtain the measurement, first configure the
channel using IviCounter_ConfigureContinuousTotalize.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �r-   �  �    Instrument Handle                �/#����  �    Status                                 	           �    This function retrieves the current count while the counter is continuously totalizing.

To obtain the measurement, first configure the
channel using IviCounter_ConfigureContinuousTotalize.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Returns the measured value.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   �q-   �  �    Instrument Handle                �. - � �  �    Measurement                      �S#����  �    Status                                 	            	          I    This function initiates and fetches a measurement based on the preset configuration.

This function waits a maximum of MaxTimeMilliseconds for the imstrument to return a measurement and generates an error if it exceeds MaxTimeMilliseconds.

Note: You must configure the measurement type and inputs before calling this function.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Pass the maximum length of time in which to allow the read waveform measurement operation to complete.  If the operation does not complete within this time interval, the function returns the Maximum Time Exceeded (0xBFFA2003) error code.  When this occurs, you can call IviCounter_Abort to cancel the read waveform operation and return the Counter to the Idle state.

You also can specify one of the following values:
IVICOUNTER_VAL_MAX_TIME_IMMEDIATE  -  The function returns immediately. If no valid measurement value exists, the function returns the Max Time Exceeded error code.
IVICOUNTER_VAL_MAX_TIME_INFINITE  -  The function waits indefinitely for the measurement to complete.

Units: milliseconds

Default Value: 5000    V    Returns the measured value.

The units depend on the measurement function you select as shown in the following list.

Rise Time                -   seconds
Fall Time                -   seconds
Frequency                -   hertz
Frequency Ratio          -   units
PRF                      -   hertz
Period                   -   seconds
Phase                    -   degrees
Negative                 -   seconds
Width Positive           -   seconds
Cycle Negative           -   percent
Duty Cycle Positive      -   percent
Time Interval            -   seconds
Totalize                 -   occurrences    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   `-   �  �    Instrument Handle                	 -  �  �    Maximum Time                     � -� �  �    Measurement                      [#����  �    Status                                 5000    	           	          U    This function initiates a measurement based on the current configuration. You must configure the measurement type and input channel before calling this function.  After you call this function, the counter leaves the Idle state and waits for a trigger.  The counter makes a measurement for each channel you enabled with the IviCounter_ConfigureChannel function. You must call the fetch function to retrieve the result of the measurement.

Note: This function does not check the instrument status.  Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  Use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviCounter_error_query function at the conclusion of the sequence.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �-   �  �    Instrument Handle                o#����  �    Status                                 	          �    This function aborts a previously initiated measurement.

Note: This function does not check the instrument status.  Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  Use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviCounter_error_query function at the conclusion of the sequence.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   $H-   �  �    Instrument Handle                %#����  �    Status                                 	              This function obtains the result from a previously initiated measurement.

Use the IviCounter_Initiate function to start the previously configured measurement. You can use the IviCounter_Status function to determine when the measurement is complete.


You can call the IviCounter_Read function instead of the IviCounter_Initiate function. The IviCounter_Read function starts a measurement. IviCounter_Read then waits for the measurement to complete, obtains the measured value, and returns the measured value. You call this function separately for any other measurements that you want to obtain on a specific channel. 

Note: This function does not check the instrument status.  Typically, you call this function only in a sequence of calls to other low-level driver functions.  The sequence performs one operation.  Use the low-level functions to optimize one or more aspects of interaction with the instrument.  If you want to check the instrument status, call the IviCounter_error_query function at the conclusion of the sequence.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    V    Returns the measured value.

The units depend on the measurement function you select as shown in the following list.

Rise Time                -   seconds
Fall Time                -   seconds
Frequency                -   hertz
Frequency Ratio          -   units
PRF                      -   hertz
Period                   -   seconds
Phase                    -   degrees
Negative                 -   seconds
Width Positive           -   seconds
Cycle Negative           -   percent
Duty Cycle Positive      -   percent
Time Interval            -   seconds
Totalize                 -   occurrences    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   1-   �  �    Instrument Handle                1� - � �  �    Measurement                      4,#����  �    Status                                 	           	           d    This function returns whether a measurement is in progress, complete, or if the status is unknown.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    y    Returns the measurement status.

The following values are defined values for this parameter:
IVICOUNTER_VAL_MEASUREMENT_COMPLETE  -  The counter timer has completed the measurement.
IVICOUNTER_VAL_MEASUREMENT_IN_PROGRESS - The counter timer is still acquiring data.
IVICOUNTER_VAL_MEASUREMENT_STATUS_UNKNOWN - The counter timer cannot determine the status of the measurement.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state when the measurement was  taken.
3FFA2002  The measurement taken was over the instrument range.
  
ERRORS:
BFFA2003  The maximum waiting time for this operation was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   <T-   �  �    Instrument Handle                = - � �  �    Status                           >�#����  �    Status                                 	           	          &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   G|#����  �    Status                           N�-   �  �    Instrument Handle                  	                  This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.  If the session was created without a Logical Name, this function is equivalent to the IviCounter_reset function.    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   Q=#����  �    Status                           X�-   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   Z#����  �    Status                           a�-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   c� 9  �  �    Self Test Result                 d� 9 � � ,    Self-Test Message                e�#����  �    Status                           m-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   o/ 9  �  �    Instrument Driver Revision       o� 9Y �  �    Firmware Revision                pK#����  �    Status                           w�-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   y� 9  �  �    Error Code                       z+ 9 � � ,    Error Message                    z�#����  �    Status                           �;-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.      z    Pass the Status parameter that is returned from any of the instrument driver functions.

Default Value:  0  (VI_SUCCESS)     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
        The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   �k 9  �  h    Error Code                       �� 9 � � �    Error Message                    ��#����  �    Status                           �-   �  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	              \    This function returns the physical channel identifier that corresponds to the one-based index that the user specifies. If the value that the user passes for the ChannelIndex parameter is less than one or greater than the value of the Channel Count attribute, the function returns an empty string in the ChannelName parameter and returns an error.     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
     �    Specifies the one-based index that defines which name to return.

Default Value:1

Valid Value: 1 - IVICOUNTER_ATTR_CHANNEL_COUNT     �    Specifies the number of bytes in the ViChar array that the user specifies for the ChannelName parameter.

Valid Range: >0

Default Value: 512     �    The buffer into which the function returns the channel name that corresponds to the index the user specifies. 
The caller may pass VI_NULL for this parameter if the Channel Name Buffer Size parameter is 0.
    u    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   ��-   �  �    Instrument Handle                �X 9  �  �    Index                            �� 9 � �  �    Channel Name Buffer Size         �z 9x �  �    Channel Name                     �R#����  �    Status                                 1    512    	            	           h    This function returns the C session instrument handle you use to call the specific driver's functions.     Z    Returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviDmm_init or IviDmm_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDmm_error_message function.  To obtain additional information about the error condition, call the IviDmm_GetError function.  To clear the error information from the driver, call the IviDmm_ClearError function.
          
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
3FFA2001  "Over range condition."

ERRORS:
BFFA1001  The trigger source is not software trigger.
BFFA2003  Maximum operation time was exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
       �p 9 � �  �    Specific Driver C Handle         ��-   �  �    Instrument Handle                ��#����  �    Status                             	               	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviCounter_GetError or IviCounter_ClearError.
    	0    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   ��#����  �    Status or Required Size          �	-   �  �    Instrument Handle                �� 9� �  �    BufferSize                       �� 9  �  �    Code                             �: � Q � �    Description                        	                   	           	           j    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviCounter_GetError function, which occurs when a call to IviCounter_init or IviCounter_InitWithOptions fails.    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           �[-   �  �    Instrument Handle                  	              �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVICOUNTER_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   �m#����  �    Status                           ��-   �  �    Instrument Handle                ܊ � Q � �    Coercion Record                  ߐ 9 � �  �    Buffer Size                        	               	               1    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVICOUNTER_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    	0    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   �#����  �    Status or Required Size          ��-   �  �    Instrument Handle                � 9 � �  �    Buffer Size                      � � Q � �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �-   �  �    Instrument Handle                ��#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviCounter_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviCounter_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviCounter_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
   �-   �  �    Instrument Handle                [#����  �    Status                                 	          R    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviCounter_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviCounter_LockSession returns successfully, no other threads can access the instrument session until you call IviCounter_UnlockSession.

Use IviCounter_LockSession and IviCounter_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviCounter_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviCounter_LockSession with a call to IviCounter_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviCounter_LockSession and IviCounter_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviCounter_LockSession.  This allows you to call IviCounter_UnlockSession just once at the end of the function. 
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviCounter_LockSession or IviCounter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviCounter_LockSession and IviCounter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviCounter_LockSession does not lock the session again.  If the value is VI_FALSE, IviCounter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviCounter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviCounter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviCounter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviCounter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviCounter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviCounter_LockSession(vi, &haveLock);
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
    IviCounter_UnlockSession(vi, &haveLock);
    return error;
}   �#����  �    Status                           +-   �  �    Instrument Handle                � 9 � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviCounter_LockSession.  Refer to IviCounter_LockSession for additional information on session locks.
    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviCounter_LockSession or IviCounter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviCounter_LockSession and IviCounter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviCounter_LockSession does not lock the session again.  If the value is VI_FALSE, IviCounter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviCounter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviCounter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviCounter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviCounter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviCounter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviCounter_LockSession(vi, &haveLock);
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
    IviCounter_UnlockSession(vi, &haveLock);
    return error;
}   'M#����  �    Status                           .�-   �  �    Instrument Handle                /� 9 � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Note:

(1) You must unlock the session before calling IviCounter_close.

(2) After calling IviCounter_close, you cannot use the instrument driver again until you call IviCounter_init or IviCounter_InitWithOptions.

    v    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviCounter_error_message function.  To obtain additional information about the error condition, call the IviCounter_GetError function.  To clear the error information from the driver, call the IviCounter_ClearError function.

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
3FFA2001  The instrument was in an uncalibrated state
          when the measurement was taken.
3FFA2002  The measurement taken was over the instrument
          range.
  
ERRORS:
BFFA2001  The Active Marker is not enabled.
BFFA2002  The Active Marker is not a delta marker.
BFFA2003  The maximum waiting time for this operation was
          exceeded.
          
This instrument driver also returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors
     �    The ViSession handle that you obtain from the IviCounter_init or IviCounter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   9�#����  �    Status                           A_-   �  �    Instrument Handle                  	            ����         	  "+             K.        init                                                                                                                                    ����         #�  D~             K.        InitWithOptions                                                                                                                         ����         FU  U�             K.        ConfigureChannel                                                                                                                        ����         W�  e�             K.        ConfigureChannelLevel                                                                                                                   ����         g  tu             K.        ConfigureChannelSlope                                                                                                                   ����         u�  ��             K.        ConfigureChannelFilterEnabled                                                                                                           ����         ��  ��             K.        ConfigureFrequency                                                                                                                      ����         �P  �	             K.        ConfigureFrequencyManual                                                                                                                ����         �>  �l             K.        ConfigureFrequencyWithApertureTime                                                                                                      ����         �^  ��             K.        ConfigurePeriod                                                                                                                         ����         �  �/             K.        ConfigurePeriodWithApertureTime                                                                                                         ����         �!  ��             K.        ConfigurePulseWidth                                                                                                                     ����         �  ��             K.        ConfigureDutyCycle                                                                                                                      ����         ��  ��             K.        ConfigureEdgeTime                                                                                                                       ����         �  �             K.        ConfigureEdgeTimeReferenceLevels                                                                                                        ����         �j �             K.        ConfigureFrequencyRatio                                                                                                                 ����        	� �             K.        ConfigureTimeInterval                                                                                                                   ����         %             K.        ConfigurePhase                                                                                                                          ����        &� 0�             K.        ConfigureContinuousTotalize                                                                                                             ����        1G =t             K.        ConfigureGatedTotalize                                                                                                                  ����        >� IN             K.        ConfigureTimedTotalize                                                                                                                  ����        J? S�             K.        ConfigureStartArm                                                                                                                       ����        T� aM             K.        ConfigureExternalStartArm                                                                                                               ����        c  li             K.        ConfigureStopArm                                                                                                                        ����        m} y�             K.        ConfigureExternalStopArm                                                                                                                ����        {� ��             K.        ConfigureFilter                                                                                                                         ����        �� ��             K.        ConfigureTimeIntervalStopHoldoff                                                                                                        ����        �� �S             K.        ConfigureVoltage                                                                                                                        ����        �� ��             K.        SetAttributeViInt32                                                                                                                     ����        �� ��             K.        SetAttributeViReal64                                                                                                                    ����        Ԁ ��             K.        SetAttributeViString                                                                                                                    ����        �k �             K.        SetAttributeViBoolean                                                                                                                   ����        Y �             K.        SetAttributeViSession                                                                                                                   ����        G .z             K.        GetAttributeViInt32                                                                                                                     ����        /� A�             K.        GetAttributeViReal64                                                                                                                    ����        C) a�             K.        GetAttributeViString                                                                                                                    ����        c uE             K.        GetAttributeViBoolean                                                                                                                   ����        v� ��             K.        GetAttributeViSession                                                                                                                   ����        �� ��             K.        CheckAttributeViInt32                                                                                                                   ����        � �m             K.        CheckAttributeViReal64                                                                                                                  ����        � ��             K.        CheckAttributeViString                                                                                                                  ����        đ ւ             K.        CheckAttributeViBoolean                                                                                                                 ����        � �             K.        CheckAttributeViSession                                                                                                                 ����        � �3             K.        StartContinuousTotalize                                                                                                                 ����        �� �0             K.        StopContinuousTotalize                                                                                                                  ����        �� T             K.        FetchContinuousTotalizeCount                                                                                                            ����         \             K.        Read                                                                                                                                    ����        T !�             K.        Initiate                                                                                                                                ����        "g ,�             K.        Abort                                                                                                                                   ����        ,� ;-             K.        Fetch                                                                                                                                   ����        ;� E�             K.        IsMeasurementComplete                                                                                                                   ����        FN O�             K.        reset                                                                                                                                   ����        P2 Yy             K.        ResetWithDefaults                                                                                                                       ����        Y� b�             K.        Disable                                                                                                                                 ����        c5 m�             K.        self_test                                                                                                                               ����        n� x�             K.        revision_query                                                                                                                          ����        y� ��             K.        error_query                                                                                                                             ����        �� �,             K.        error_message                                                                                                                           ����        �( ��             K.        InvalidateAllAttributes                                                                                                                 ����        �6 ��             K.        GetChannelName                                                                                                                          ����        �  �7             K.        GetSpecificDriverCHandle                                                                                                                ����        �� �6             K.        GetError                                                                                                                                ����        �k �             K.        ClearError                                                                                                                              ����        ϓ �             K.        GetNextCoercionRecord                                                                                                                   ����        �y ��             K.        GetNextInterchangeWarning                                                                                                               ����        ��  K             K.        ClearInterchangeWarnings                                                                                                                ����         � �             K.        ResetInterchangeCheck                                                                                                                   ����        S %�             K.        LockSession                                                                                                                             ����        &� 7s             K.        UnlockSession                                                                                                                           ����        8. B             K.        close                                                                                                                                         '                                                                                     �Initialize                                                                           �Initialize With Options                                                             �Configuration                                                                        �Configure Channel                                                                    �Configure Channel Level                                                              �Configure Channel Slope                                                              �Configure Channel Filter Enabled                                                     �Configure Frequency                                                                  �Configure Frequency Manual                                                           �Configure Frequency With Aperture Time                                               �Configure Period                                                                     �Configure Period With Aperture Time                                                  �Configure Pulse Width                                                                �Configure Duty Cycle                                                                 �Configure Edge Time                                                                  �Configure Edge Time Reference Levels                                                 �Configure Frequency Ratio                                                            �Configure Time Interval                                                              �Configure Phase                                                                      �Configure Continuous Totalize                                                        �Configure Gated Totalize                                                             �Configure Timed Totalize                                                             �Configure Start Arm                                                                  �Configure External Start Arm                                                         �Configure Stop Arm                                                                   �Configure External Stop Arm                                                          �Configure Filter                                                                     �Configure Time Interval Stop Holdoff                                                 �Configure Voltage                                                                   �Set/Get/Check Attribute                                                             YSet Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             tCheck Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           Measurement                                                                          �Start Continuous Totalize                                                            �Stop Continuous Totalize                                                             �Fetch Continuous Totalize Count                                                      �Read                                                                                [Low Level Measurement                                                                �Initiate                                                                             �Abort                                                                                �Fetch                                                                                �Is Measurement Complete                                                             �Utility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Channel Name                                                                     �Get Specific Driver C Handle                                                        Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         sCoercion Info                                                                        �Get Next Coercion Record                                                            �Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             	Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           