s��   	     $�   w ��  E    �   ����                                IviDigitizer                    IviDigitizer Class Driver (NI)              _VI_FUNC                                                     � ��ViInt8  � � ��ViInt16  �  � ��ViInt32  � � ��ViInt64  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     �  ViInt8[]     	�  ViInt16[]     	�  ViInt32[]     	�  ViInt64[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr   �    This instrument driver contains programming support for the IviDigitizer class driver. This driver has all the functions that IVI and VXIplug&play require. 

Notes:  This driver requires the VISA and IVI libraries.      5    This class contains functions for self calibration.     �    This class contains functions and sub-classes that configure the instrument. The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     I    This class contains functions that configure the acquisition subsystem.     �    This class contains functions that supports digitizers with the ability to do frequency translation or downconversion in hardware.     ,    This group contains arm related functions.     h    This class contains functions and sub-classes that configure the individual channels of the digitizer.     s    This class contains functions that configure the Data interleaved channel list and Time interleaved channel list.     q    This class contains functions that support digitizers with the ability to use an external reference oscillator.     k    This class contains functions that support with the ability to use (or provide) an external sample clock.     0    This group contains trigger related functions.     S    This class contains sub-classes for the set, get, and check attribute functions.      �    This class contains functions that set an attribute to a new value. There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute. There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute. There are typesafe functions for each attribute data type.    �    This class contains functions and sub-classes that initiate and retrieve waveforms and waveform acquisition using the current configuration. The class contains high-level read functions that intiate an acquisition and fetch the data in one operation. The class also contains low-level functions that intiate an acquisition, and fetch a waveform or wavefrom acquisition in separate operations.     _    This class contains functions and sub-classes that transfer data to and from the instrument.
     h    This class contains functions that perform multi-record acquisitions, and/or fetch of partial records.    ]    This class contains functions and sub-classes that control common instrument operations. These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message. This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     _    This class contains functions that configure the temperature units and query the temperature.     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    L    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so. You can use the same session in multiple program threads. You can use the IviDigitizer_LockSession and IviDigitizer_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleDigitizer"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive. If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports. 

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument. When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it. This is useful if you have multiple physical instances of the same type of instrument. 

(2) Avoid creating multiple concurrent sessions to the same physical instrument. Although you can create more than one IVI session for the same resource, it is best not to do so. A better approach is to use the same IVI session in multiple execution threads. You can use functions IviDigitizer_LockSession and IviDigitizer_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0101  ID Query not supported.
3FFC0102  Reset not supported.

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFA0000  Cannot load IVI engine.
BFFA0001  Instrument error. Call IviDigitizer_error_query.
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
    K 9   �  �    Logical Name                       9 �       ID Query                          # 9� �       Reset Device                      �# 
 �  �    Instrument Handle                 �#����  �    Status                             "SampleDigitizer"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          j    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVIDIGITIZER_ATTR_RANGE_CHECK         
    IVIDIGITIZER_ATTR_QUERY_INSTRUMENT_STATUS  
    IVIDIGITIZER_ATTR_CACHE               
    IVIDIGITIZER_ATTR_SIMULATE            
    IVIDIGITIZER_ATTR_RECORD_COERCIONS   

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so. You can use the same session in multiple program threads. You can use the IviDigitizer_LockSession and IviDigitizer_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use. The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session. You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleDigitizer"

Warning: 
All IVI names, such as logical names or virtual names, are case-sensitive. If you use logical names, driver session names, or virtual names in your program, you must make sure that the name you use matches the name in the IVI Configuration Store file exactly, without any variations in the case of the characters in the name.        Specify whether you want the instrument driver to perform an ID Query.

Valid Range:
VI_TRUE  (1) - Perform ID Query (Default Value)
VI_FALSE (0) - Skip ID Query

When you set this parameter to VI_TRUE, the driver verifies that the instrument you initialize is a type that this driver supports. 

Circumstances can arise where it is undesirable to send an ID Query command string to the instrument. When you set this parameter to VI_FALSE, the function initializes the instrument without performing an ID Query.     �    Specify whether you want the to reset the instrument during the initialization procedure.

Valid Range:
VI_TRUE  (1) - Reset Device (Default Value)
VI_FALSE (0) - Don't Reset

    �    Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Notes:

(1) This function creates a new session each time you invoke it. This is useful if you have multiple physical instances of the same type of instrument. 

(2) Avoid creating multiple concurrent sessions to the same physical instrument. Although you can create more than one IVI session for the same resource, it is best not to do so. A better approach is to use the same IVI session in multiple execution threads. You can use functions IviDigitizer_LockSession and IviDigitizer_UnlockSession to protect sections of code that require exclusive access to the resource.

    	�    Reports the status of this operation.

To obtain a text description of the status code, or if the status code is not listed below, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

Status Codes:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0101  ID Query not supported.
3FFC0102  Reset not supported.

3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFA0000  Cannot load IVI engine.
BFFA0001  Instrument error. Call IviDigitizer_error_query.
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
    �    You can use this control to set the initial value of certain attributes for the session. The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIDIGITIZER_ATTR_RANGE_CHECK
QueryInstrStatus  IVIDIGITIZER_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIDIGITIZER_ATTR_CACHE   
Simulate          IVIDIGITIZER_ATTR_SIMULATE  
RecordCoercions   IVIDIGITIZER_ATTR_RECORD_COERCIONS

The format of this string is, "AttributeName=Value" where AttributeName is the name of the attribute and Value is the value to which the attribute will be set. To set multiple attributes, separate their assignments with a comma. 

If you pass NULL or an empty string for this parameter, the session uses the default values for the attributes.  You can override the default values by assigning a value explicitly in a string you pass for this parameter. You do not have to specify all of the attributes and may leave any of them out. If you do not specify one of the attributes, its default value will be used. 

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
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"
    0� 9   �  �    Logical Name                      4R 9 �       ID Query                          6[ 9� �       Reset Device                      7# 
 �  �    Instrument Handle                 9�#����  �    Status                            C� �  � �    Option String                      "SampleDigitizer"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    �    This function executes all internal calibrations. If the digitizer does not support calibration, this function succeeds silently.

Note: This function is part of the IviDigitizerSelfCalibration [CAL] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    L�-   �  �    Instrument Handle                 M�#����  �    Status                                 	           �    This function configures the most commonly configured attributes of the digitizer acquisition sub-system: IVIDIGITIZER_ATTR_RECORD_SIZE, IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE, and IVIDIGITIZER_ATTR_SAMPLE_RATE.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Specifies the number of records in the acquisition. The driver uses this value to set the IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE attribute.

Default Value: 1     �    Specifies the number of samples in each record. The driver uses this value to set the IVIDIGITIZER_ATTR_RECORD_SIZE attribute.

Default Value: 256     �    Specifies the sample rate in samples per second. The driver uses this value to set the IVIDIGITIZER_ATTR_SAMPLE_RATE attribute.

Default Value: 1.0e5
    VJ-   �  �    Instrument Handle                 W#����  �    Status                            ^u 9  �  �    Number of Records                 _ 9 � �  �    Record Size                       _� 9� �  �    Sample Rate                            	           1    256    1.0e5    �    This function configures the digitizer sample mode.

Note: This function is part of the IviDigitizerSampleMode [SM] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    j    Specifies the sample mode used by the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_SAMPLE_MODE attribute.

Valid Values:

- IVIDIGITIZER_VAL_SAMPLE_MODE_REAL_TIME  - Specifies real-time sampling.

- IVIDIGITIZER_VAL_SAMPLE_MODE_EQUIVALENT_TIME  -  Specifies equivalent-time sampling.

Default Value: IVIDIGITIZER_VAL_SAMPLE_MODE_REAL_TIME    b-   �  �    Instrument Handle                 b�#����  �    Status                            jA 9 � � �    Sample Mode                            	                      nReal Time IVIDIGITIZER_VAL_SAMPLE_MODE_REAL_TIME Equivalent Time IVIDIGITIZER_VAL_SAMPLE_MODE_EQUIVALENT_TIME    �    This function configures how the digitizer handles downconversion.

Note: This function is part of the IviDigitizerDownconversion [DC] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel to configure.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the center frequency, in Hz, from which the digitizer should downconvert. The driver uses this value to set the IVIDIGITIZER_ATTR_DOWNCONVERSION_CENTER_FREQUENCY attribute.

Unit: Hertz

Default Value: 1.0e6     �    Specifies whether to enable or disable downconversion. The driver uses this value to set the IVIDIGITIZER_ATTR_DOWNCONVERSION_ENABLED attribute.

Valid Values:
VI_TRUE - Enable downconversion
VI_FALSE - Disable downconversion

Default Value: VI_FALSE    m�-   �  �    Instrument Handle                 nA#����  �    Status                            u� 9  �  �    Channel Name                      w? 9� �  �    Center Frequency (Hz)             x" 9 � �    Downconversion Enabled                 	           ""    1.0e6    On VI_TRUE Off VI_FALSE   ,    This function sets the edge arming attributes. An edge occurs when the arm signal specified with the armSource parameter passes through the voltage threshold specified with the armLevel parameter and has the slope specified with the triggerSlope parameter.

This function affects instrument behavior only if the IVIDIGITIZER_ATTR_ARM_TYPE attribute is IVIDIGITIZER_VAL_EDGE_ARM. Set the IVIDIGITIZER_ATTR_ARM_TYPE and IVIDIGITIZER_ATTR_ARM_COUPLING attributes before calling this function.

If the arm source is one of the analog input channels, make sure to configure the IVIDIGITIZER_ATTR_ARM_COUPLING, IVIDIGITIZER_ATTR_VERTICAL_COUPLING, and the IVIDIGITIZER_ATTR_INPUT_FILTER_MAX_FREQUENCY attributes before calling this function.

Note: This function is part of the IviDigitizerArm [ARM] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Specifies the arm level. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_LEVEL attribute.

Unit: volts

Default Value: 1.0

    �    Specifies the trigger slope. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_SLOPE attribute.

Valid Values:

- IVIDIGITIZER_VAL_TRIGGER_SLOPE_NEGATIVE  -  A negative (falling) edge passing through the arm level triggers the digitizer.

- IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE  -  A positive (rising) edge passing through the arm level triggers the digitizer.

Default Value: IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE    �    Specifies the arm source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE  attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.    }�-   �  �    Instrument Handle                 ~^#����  �    Status                            �� 9 � �  �    Arm Level (volts)                 �Z 9� � �    Trigger Slope                     � 9  �  �    Arm Source                             	           1.0              bNegative IVIDIGITIZER_VAL_TRIGGER_SLOPE_NEGATIVE Positive IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE    ""   a    This function configures the glitch arm. A glitch arm occurs when the arm signal has a pulse with a width that is less than or greater than the glitch width. 

Specify which comparison criterion to use with the glitchCondition parameter. Use the glitchWidth parameter and glitchPolarity parameter to specify the glitch width and the polarity of the pulse, respectively. 

The arm does not actually occur until the edge of a pulse that corresponds to the glitchWidth and glitchPolarity crosses the threshold specified in the triggerLevel parameter. This function affects instrument behavior only if the IVIDIGITIZER_ATTR_ARM_TYPE attribute is IVIDIGITIZER_VAL_GLITCH_ARM. 

Set the IVIDIGITIZER_ATTR_ARM_TYPE and IVIDIGITIZER_ATTR_ARM_COUPLING attributes before calling this function.

Note: This function is part of the IviDigitizerGlitchArm [GA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    c    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors
    �    Specifies the arm source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE  attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.    �    Specifies the glitch polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_ARM_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_GLITCH_POSITIVE  -  The digitizer triggers on a positive glitch.

- IVIDIGITIZER_VAL_GLITCH_NEGATIVE  -  The digitizer triggers on a negative glitch.

- IVIDIGITIZER_VAL_GLITCH_EITHER  -  The digitizer triggers on either a positive or negative glitch.

Default Value: IVIDIGITIZER_VAL_GLITCH_POSITIVE     �    Specifies the arm level. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_LEVEL attribute.

Unit: volts

Default Value: 1.0     �    Specifies the glitch arming glitch width in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_ARM_WIDTH attribute.

Unit: seconds

Default Value: 0.1
        Specifies the glitch condition. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_ARM_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_GLITCH_LESS_THAN  -  The digitizer triggers when the pulse width is less than the value you specify with the IVIDIGITIZER_ATTR_GLITCH_ARM_WIDTH attribute.

- IVIDIGITIZER_VAL_GLITCH_GREATER_THAN  -  The digitizer triggers when the pulse width is greater than the value you specify with the IVIDIGITIZER_ATTR_GLITCH_ARM_WIDTH attribute.

Default Value: IVIDIGITIZER_VAL_GLITCH_LESS_THAN    ��-   �  �    Instrument Handle                 ��#����  �    Status                            � 9  �  �    Arm Source                        �� �  � �    Glitch Polarity                   �� 9 � �  �    Arm Level (volts)                 �\ 9� �  �    Glitch Width (sec)                � � � � �    Glitch Condition                       	           ""               zPositive IVIDIGITIZER_VAL_GLITCH_POSITIVE Negative IVIDIGITIZER_VAL_GLITCH_NEGATIVE Either IVIDIGITIZER_VAL_GLITCH_EITHER    1.0    0.1               ^Less Than IVIDIGITIZER_VAL_GLITCH_LESS_THAN Greater Than IVIDIGITIZER_VAL_GLITCH_GREATER_THAN        This function configures the digitizer to arm based on multiple arm sources.

The digitizer can arm when any one of multiple arm source conditions are met or when all specified arm source conditions are met.

Note: This function is part of the IviDigitizerMultiArm [MA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the Boolean operation to apply to the arm sources specified by the sourceList parameter. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_SOURCE_OPERATOR attribute.

Valid Values:

- IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_AND  -  Use the AND Boolean operation for arm sources. The digitizer arms when all configured arm source conditions are satisfied.

- IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_OR  -  Use the OR Boolean operation for arm sources. The digitizer arms when the first configured arm source condition is satisfied.

- IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_NONE  -  No operator is applied to the configured list of arm sources. The arm source list is ignored, and the digitizer arms when the active arm source, specified by the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE attribute, and its associated arm conditions are satisfied.

Default Value: IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_AND    �    A comma-separated list of source names to use in a multi arm scenario. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_SOURCE_LIST attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the source names as a string variable or as a literal enclosed in double quotes.    ��-   �  �    Instrument Handle                 ��#����  �    Status                            � 9H � �    Arm Source Operator               �� 9 H �  �    Source List                            	                      �And IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_AND Or IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_OR None IVIDIGITIZER_VAL_ARM_SOURCE_OPERATOR_NONE    ""   R    This function configures the runt arm. A runt occurs when the arm signal crosses one of the runt threshold values twice without crossing the other runt threshold.

Specify the runt threshold values with the thresholdLow and thresholdHigh parameters. Use the runtPolarity parameter to specify the polarity of the runt. 

This function affects instrument behavior only if the arm type is runt trigger. Set the IVIDIGITIZER_ATTR_ARM_TYPE and IVIDIGITIZER_ATTR_TRIGGER_COUPLING attributes before calling this function.

Note: This function is part of the IviDigitizerRuntArm [RA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the arm source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.    �    Sets the runt polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_RUNT_ARM_POLARITY attribute.


Valid Values:

- IVIDIGITIZER_VAL_RUNT_POSITIVE  -  The digitizer triggers on a positive runt. A positive runt occurs when a rising edge crosses the low runt threshold and does not cross the high runt threshold before re-crossing the low runt threshold.

- IVIDIGITIZER_VAL_RUNT_NEGATIVE  -  The digitizer triggers on a negative runt. A negative runt occurs when a falling edge crosses the high runt threshold and does not cross the low runt threshold before re-crossing the high runt threshold.

- IVIDIGITIZER_VAL_RUNT_EITHER  -  The digitizer triggers on either a positive or negative runt.

Default Value: IVIDIGITIZER_VAL_RUNT_POSITIVE     U    Sets the runt triggering low threshold, in volts.

Unit: volts

Default Value: 1.0
     V    Sets the runt triggering high threshold, in volts.

Unit: volts

Default Value: 1.0
    ��-   �  �    Instrument Handle                 �P#����  �    Status                            �� 9  �  �    Arm Source                        �� �  � �    Runt Polarity                     �� 9 � �  �    Threshold Low (volts)             �� 9� �  �    Threshold High (volts)                 	           ""               tPositive IVIDIGITIZER_VAL_RUNT_POSITIVE Negative IVIDIGITIZER_VAL_RUNT_NEGATIVE Either IVIDIGITIZER_VAL_RUNT_EITHER    1.0    1.0   �    This function configures the digitizer for TV arming. This function configures the TV signal format, arm event, and the signal polarity.

This function affects instrument behavior only if the IVIDIGITIZER_ATTR_ARM_TYPE attribute is IVIDIGITIZER_VAL_TV_ARM. Set the IVIDIGITIZER_ATTR_ARM_TYPE and IVIDIGITIZER_ATTR_ARM_COUPLING attributes before calling this function.

Note: This function is part of the IviDigitizerTVArm [TVA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the arm source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.    s    Specifies the polarity of the TV arm signal. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_ARM_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_TV_POSITIVE  -  The digitizer triggers on a positive video sync pulse.

- IVIDIGITIZER_VAL_TV_NEGATIVE  -  The digitizer triggers on a negative video sync pulse.

Default Value: IVIDIGITIZER_VAL_TV_POSITIVE    �    Specifies the TV arm signal format. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_ARM_SIGNAL_FORMAT attribute.

Valid Values:

- IVIDIGITIZER_VAL_NTSC  -  The digitizer triggers on the NTSC signal format.

- IVIDIGITIZER_VAL_PAL  -  The digitizer triggers on the PAL signal format.

- IVIDIGITIZER_VAL_SECAM  -  The digitizer triggers on the SECAM signal format

Default Value: IVIDIGITIZER_VAL_NTSC    �    Specifies the TV arm event. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_ARM_EVENT attribute.

Valid Values:

- IVIDIGITIZER_VAL_TV_EVENT_FIELD1  -  The digitizer triggers on field 1 of the video signal.

- IVIDIGITIZER_VAL_TV_EVENT_FIELD2  -  The digitizer triggers on field 2 of the video signal.

- IVIDIGITIZER_VAL_TV_EVENT_ANY_FIELD  -  The digitizer triggers    on any field.

- IVIDIGITIZER_VAL_TV_EVENT_ANY_LINE  -  The digitizer triggers on any line.

- IVIDIGITIZER_VAL_TV_EVENT_LINE_NUMBER  -  The digitizer triggers on a specific line number you specify with the IVIDIGITIZER_ATTR_TV_ARM_LINE_NUMBER attribute.

Default Value: IVIDIGITIZER_VAL_TV_EVENT_FIELD1    ��-   �  �    Instrument Handle                 Ź#����  �    Status                            �# 9  �  �    Arm Source                        � �  � �    TV Polarity                       �} 9 � � �    Signal Format                     �# 9� � �    Arm Event                              	           ""               LPositive IVIDIGITIZER_VAL_TV_POSITIVE Negative IVIDIGITIZER_VAL_TV_NEGATIVE               QNTSC IVIDIGITIZER_VAL_NTSC PAL IVIDIGITIZER_VAL_PAL SECAM IVIDIGITIZER_VAL_SECAM               �Field1 IVIDIGITIZER_VAL_TV_EVENT_FIELD1 Field2 IVIDIGITIZER_VAL_TV_EVENT_FIELD2 Any Field IVIDIGITIZER_VAL_TV_EVENT_ANY_FIELD Any Line IVIDIGITIZER_VAL_TV_EVENT_ANY_LINE Line Number IVIDIGITIZER_VAL_TV_EVENT_LINE_NUMBER    �    This function configures width arm.

A width arm occurs when a pulse that passes through the arm level with a width between or outside the width thresholds is detected.

Note: This function is part of the IviDigitizerWidthArm [WA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the arm source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.        Sets the width polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_ARM_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_WIDTH_POSITIVE  -  The digitizer triggers on positive pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_ARM_CONDITION attribute.

- IVIDIGITIZER_VAL_WIDTH_NEGATIVE  -  The digitizer triggers on negative pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_ARM_CONDITION attribute.

- IVIDIGITIZER_VAL_WIDTH_EITHER  -  Configures the digitizer to trigger on either positive or negative pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_ARM_CONDITION attribute.

Default Value: IVIDIGITIZER_VAL_WIDTH_POSITIVE     �    Specifies the arm level. The driver uses this value to set the IVIDIGITIZER_ATTR_ARM_LEVEL attribute.

Unit: volts

Default Value: 1.0    }    Specifies whether a pulse that is within or outside the specified thresholds arms the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_ARM_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_WIDTH_WITHIN  -  The digitizer triggers on pulses that have a width that is less than the high threshold and greater than the low threshold. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WIDTH_ARM_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WIDTH_ARM_LOW_THRESHOLD attributes, respectively.

- IVIDIGITIZER_VAL_WIDTH_OUTSIDE  -  The digitizer triggers on pulses that have a width that is either greater than the high threshold or less than a low threshold. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WIDTH_ARM_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WIDTH_ARM_LOW_THRESHOLD attributes, respectively.

Default Value: IVIDIGITIZER_VAL_WIDTH_WITHIN     �    Sets the width arming low threshold, in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_ARM_LOW_THRESHOLD attribute.

Unit: volts

Default Value: 1.0     �    Sets the width arming high threshold, in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_ARM_HIGH_THRESHOLD attribute.

Unit: volts

Default Value: 1.0    ��-   �  �    Instrument Handle                 ٖ#����  �    Status                            �  9  �  �    Arm Source                        �� � � � �    Width Polarity                    �� 9 � �  �    Arm Level (volts)                 � �� � �    Width Condition                   �	 9� �  �    Threshold Low (volts)             �� �  �  �    Threshold High (volts)                 	           ""               wPositive IVIDIGITIZER_VAL_WIDTH_POSITIVE Negative IVIDIGITIZER_VAL_WIDTH_NEGATIVE Either IVIDIGITIZER_VAL_WIDTH_EITHER    1.0               LWithin IVIDIGITIZER_VAL_WIDTH_WITHIN Outside IVIDIGITIZER_VAL_WIDTH_OUTSIDE    1.0    1.0    �    This function configures the window arm.

A window arm occurs when a signal that enters or leaves a given voltage range is detected.

Note: This function is part of the IviDigitizerWindowArm [WINA] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the arm source to configure. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_ARM_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual arm source name. The virtual arm source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical arm source name.

Default Value: ""

Note: You can specify the arm source name as a string variable or as a literal enclosed in double quotes.    r    Specifies whether a pulse that is entering or leaving the voltage window defined by the high and low threshold values arms the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_ARM_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING  -  The digitizer triggers on signals when they enter the given triggering window. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WINDOW_ARM_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WINDOW_ARM_LOW_THRESHOLD attributes, respectively.

- IVIDIGITIZER_VAL_WINDOW_CONDITION_LEAVING  -  The digitizer triggers on signals when they leave the given triggering window. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WINDOW_ARM_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WINDOW_ARM_LOW_THRESHOLD attributes, respectively.

Default Value: IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING     �    Sets the window arming low threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_ARM_LOW_THRESHOLD attribute.

Unit: volts

Default Value: 1.0     �    Sets the window arming high threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_ARM_HIGH_THRESHOLD attribute.

Unit: volts

Default Value: 1.0    �-   �  �    Instrument Handle                 ��#����  �    Status                            �8 9  �  �    Arm Source                        �$ �  � �    Windows Condition                 �� 9 � �  �    Threshold Low (volts)             �T 9� �  �    Threshold High (volts)                 	           ""               fEntering IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING Leaving IVIDIGITIZER_VAL_WINDOW_CONDITION_LEAVING    1.0    1.0   '    This function returns the specific driver defined arm source name that corresponds to the one-based index that you specify.

If the driver defines a qualified arm source name, this function returns the qualified name. 

If the value that you pass for the sourceIndex parameter is less than one or greater than the value of the IVIDIGITIZER_ATTR_ARM_SOURCE_COUNT attribute, the function returns an empty string in the sourceName parameter and returns the Invalid Value error.

Note: This function is part of the IviDigitizerArm [ARM] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     H    A one-based index that defines which name to return.

Default Value: 1     l    The number of bytes in the ViChar array that you specify for the sourceName parameter.

Default Value: 256     �    Returns the arm source name that corresponds to the sourceIndex. 

The sourceName buffer must contain at least as many elements as the value you specify with the sourceNameBufferSize parameter.   -   �  �    Instrument Handle                �#����  �    Status                           � 9  �  �    Source Index                     @ 9 � �  �    Source Name Buffer Size          � 9� �  �    Source Name                            	           1    256    	            �    This function configures the most commonly configured attributes of the digitizer channel sub-system: IVIDIGITIZER_ATTR_VERTICAL_RANGE, IVIDIGITIZER_ATTR_VERTICAL_OFFSET, IVIDIGITIZER_ATTR_VERTICAL_COUPLING, and IVIDIGITIZER_ATTR_CHANNEL_ENABLED.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel to configure.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    �    Specifies how to couple the input signal. The driver uses this value to set the IVIDIGITIZER_ATTR_VERTICAL_COUPLING attribute.

Valid Values:

- IVIDIGITIZER_VAL_VERTICAL_COUPLING_AC  -  The digitizer AC couples the input signal.

- IVIDIGITIZER_VAL_VERTICAL_COUPLING_DC  -  The digitizer DC couples the input signal.

- IVIDIGITIZER_VAL_VERTICAL_COUPLING_GND  -  The digitizer couples the channel to the ground.

Default Value: IVIDIGITIZER_VAL_VERTICAL_COUPLING_AC     �    Specifies the vertical range. The driver uses this value to set the IVIDIGITIZER_ATTR_VERTICAL_RANGE attribute.

Unit: volts

Default Value: 1.0
        Specifies if the channel is enabled for acquisition. The driver uses this value to set the IVIDIGITIZER_ATTR_CHANNEL_ENABLED attribute.

Valid Values: 

VI_TRUE - Enable the channel for acquisition
VI_FALSE - Disable the channel for acquisition

Default Value: VI_TRUE     �    Specifies the vertical offset. The driver uses this value to set the IVIDIGITIZER_ATTR_VERTICAL_OFFSET attribute.

Unit: volts

Default Value: 0.0
   �-   �  �    Instrument Handle                q#����  �    Status                           � 9  �  �    Channel Name                     o �  � �    Vertical Coupling                K 9 � �  �    Vertical Range (volts)           � � �  �    Channel Enabled                  � 9� �  �    Vertical Offset (volts)                	           ""               �AC Coupling IVIDIGITIZER_VAL_VERTICAL_COUPLING_AC DC Coupling IVIDIGITIZER_VAL_VERTICAL_COUPLING_DC Ground IVIDIGITIZER_VAL_VERTICAL_COUPLING_GND    1.0   On VI_TRUE Off VI_FALSE    0.0    �    This function is used to configure the minimum and maximum input filter frequencies for a specified channel.

Note: This function is part of the IviDigitizerChannelFilter [CF] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel to configure.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the minimum input filter frequency. The driver uses this value to set the IVIDIGITIZER_ATTR_INPUT_FILTER_MIN_FREQUENCY attribute.

Unit: Hertz
Default Value: 1.0e6     �    Specifies the maximum input filter frequency. The driver uses this value to set the IVIDIGITIZER_ATTR_INPUT_FILTER_MAX_FREQUENCY attribute.

Unit: Hertz
Default Value: 1.0e8    �-   �  �    Instrument Handle                !w#����  �    Status                           (� 9  �  �    Channel Name                     *u 9 � �  �    Min Frequency (Hz)               +, 9� �  �    Max Frequency (Hz)                     	           ""    1.0e6    1.0e8   �    This function returns the specific driver defined channel name that corresponds to the one-based index that you specifies.

If the driver defines a qualified channel name, this function returns the qualified name.

If the specified value is less than one or greater than the value of the IVIDIGITIZER_ATTR_CHANNEL_COUNT attribute, the function returns an empty string in the channelName parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     H    A one-based index that defines which name to return.

Default Value: 1     l    The number of bytes in the ViChar array that you specify for the sourceName parameter.

Default Value: 256     �    Returns the trigger source name that corresponds to the channelIndex. 

The channelName buffer must contain at least as many elements as the value you specify with the channelNameBufferSize parameter.
   .�-   �  �    Instrument Handle                /�#����  �    Status                           8� 9  �  �    Channel Index                    8� 9 � �  �    Channel Name Buffer Size         9q 9� �  �    Channel Name                           	           1    256    	           2    This function combines the channel name you specify with one or more other channels to interleave the returned data. Specify the channels you want to combine with the current channel as a comma-separated list of one or more channel names in the channelList parameter. You can specify either physical or virtual repeated capability identifiers in this list. Pass an empty string or VI_NULL to indicate that no channels should be combined or that none are currently combined, in the case of a query.

If a channel name specified in the list is not recognized, the driver generates the Unknown Channel Name error. If a channel name specified in the list is not enabled, this attribute generates the Channel Not Enabled error.

Setting this attribute on a channel designates that channel as the one on which to make subsequent fetch and read operations. Because fetch and read operations return the data from multiple channels, you must ensure that you allocate sufficient memory.

Note: This function is part of the IviDigitizerDataInterleavedChannels [DIC] extension group.
     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel to combine with those in channelList.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.    G    A comma-separated list of one or more channel names to combine with the channel specified by channelName. The driver uses this value to set the IVIDIGITIZER_ATTR_DATA_INTERLEAVED_CHANNEL_LIST attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.   ?�-   �  �    Instrument Handle                @p#����  �    Status                           G� 9 P �  �    Channel Name                     I� 9Q �  �    Channel List                           	           ""    ""       This function combines this channel with one or more other channels to achieve higher effective sampling rates and greater memory depth. Calling this function disables automatic combined mode (combined channels auto is set to false).

Calling this function on a channel designates that channel as the one on which to make subsequent channel-based operations. This includes fetch and read operations and configuration operations such as setting the IVIDIGITIZER_ATTR_VERTICAL_COUPLING, IVIDIGITIZER_ATTR_VERTICAL_OFFSET, and IVIDIGITIZER_ATTR_VERTICAL_RANGE attributes. Because fetch and read operations return the data from multiple channels, you must ensure that you allocate sufficient memory.

Note: This function is part of the IviDigitizerTimeInterleavedChannels [TIC] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel to be combined with those in ChannelList.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note:

You can specify the channel name as a string variable or as a literal enclosed in double quotes.    G    A comma-separated list of one or more channel names to combine with the channel specified by channelName. The driver uses this value to set the IVIDIGITIZER_ATTR_TIME_INTERLEAVED_CHANNEL_LIST attribute.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.   N�-   �  �    Instrument Handle                O�#����  �    Status                           W 9 P �  �    Channel Name                     X� 9Q �  �    Channel List                           	           ""    ""    �    This function configures the reference oscillator of the digitizer.

Note: This function is part of the IviDigitizerReferenceOscillator [RO] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the source of the reference frequency signal. The driver uses this value to set the IVIDIGITIZER_ATTR_REFERENCE_OSCILLATOR_SOURCE attribute.

Valid Values:

- IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL  -  Use the internal reference oscillator.

- IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL  -  Use an external reference oscillator.

- IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_PXIE_CLK100 - Use
the PXIe backplane 100 MHz reference oscillator.
 
- IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_PXIE_CLK100 - Use the PXIe backplane 100 MHz reference oscillator.
 
Default Value: IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL    L    Specifies the frequency of the external reference oscillator. This parameter is used only if the oscillatorSource parameter is set to IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL. The driver uses this value to set the IVIDIGITIZER_ATTR_REFERENCE_OSCILLATOR_EXTERNAL_FREQUENCY attribute.

Unit: Hertz

Default Value: 1.0e6   [�-   �  �    Instrument Handle                \h#����  �    Status                           c� 9 N � �    Oscillator Source                fv 9L �  �    Oscillator Frequency (Hz)              	                     Internal IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL External IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL PXIClk10 IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_PXI_CLK10 PXIeClk100 IVIDIGITIZER_VAL_REFERENCE_OSCILLATOR_SOURCE_PXIE_CLK100    1.0e6    �    This function configures whether the reference frequency signal appears at an output of the digitizer.

Note:

(1) This function is part of the IviDigitizerReferenceOscillator [RO] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    M    Specifies whether the reference frequency signal appears at a reference output of the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_REFERENCE_OSCILLATOR_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE - Enable reference oscillator output
VI_FALSE - Disable reference oscillator output

Default Value: VI_FALSE   j�-   �  �    Instrument Handle                kX#����  �    Status                           r� 9
 � �    Output Enabled                         	           On VI_TRUE Off VI_FALSE    �    This function configures the sample clock of the digitizer.

Note: This function is part of the IviDigitizerSampleClock [SC] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    |    Specifies the source of the sample clock signal. The driver uses this value to set the IVIDIGITIZER_ATTR_SAMPLE_CLOCK_SOURCE attribute.

Valid Values:

- IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL  -  Use the internal sample clock.

- IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL  -  Use an external sample clock.

Default Value: VIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL    5    Specifies the frequency of the external sample clock. This parameter is used only if the sampleClockSource parameter is set to IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL. The driver uses this value to set the IVIDIGITIZER_ATTR_SAMPLE_CLOCK_EXTERNAL_FREQUENCY attribute.

Unit: Hertz

Default Value: 1.0e6     �    Specifies the value by which the external sample clock is divided. This value is used only if the sampleClockSource parameter is set to IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL.

Default Value: 1.0
   ux-   �  �    Instrument Handle                v9#����  �    Status                           }� 9  � �    Sample Clock Source              ' 9 � �  �    Frequency (Hz)                   �d 9� �  �    Divider                                	                      nInternal IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_INTERNAL External IVIDIGITIZER_VAL_SAMPLE_CLOCK_SOURCE_EXTERNAL    1.0e6    1.0    �    This function configures whether the sample clock appears at a reference output of the digitizer.

Note: This function is part of the IviDigitizerSampleClock [SC] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    '    Specifies whether the sample clock appears at a reference output of the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_SAMPLE_CLOCK_OUTPUT_ENABLED attribute.

Valid Values:
VI_TRUE - Enable sample clock output
VI_FALSE - Disable sample clock output

Default Value: VI_FALSE   ��-   �  �    Instrument Handle                �]#����  �    Status                           �� 9
 � �    Output Enabled                         	           On VI_TRUE Off VI_FALSE       This function sets the active triggering attributes, which specifies the source the digitizer monitors for the trigger event.

This function affects instrument behavior only if the IviDigitizerMultiTrigger extension group is not supported or the trigger source operator is set to None.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source to configure. 

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.   ��-   �  �    Instrument Handle                ��#����  �    Status                           � > � �  �    Trigger Source                         	           ""       This function sets the edge triggering attributes. An edge trigger occurs when the trigger signal specified with the triggerSource parameter passes through the voltage threshold specified with the triggerLevel parameter and has the slope specified with the triggerSlope parameter.

This function affects instrument behavior only if the IVIDIGITIZER_ATTR_TRIGGER_TYPE attribute is IVIDIGITIZER_VAL_EDGE_TRIGGER. Set the IVIDIGITIZER_ATTR_TRIGGER_TYPE and IVIDIGITIZER_ATTR_TRIGGER_COUPLING attributes before calling this function.

If the trigger source is one of the analog input channels, configure the IVIDIGITIZER_ATTR_VERTICAL_RANGE, IVIDIGITIZER_ATTR_VERTICAL_COUPLING, and the IVIDIGITIZER_ATTR_INPUT_FILTER_MAX_FREQUENCY attributes before calling this function.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger slope. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_SLOPE attribute.

Valid Values:

- IVIDIGITIZER_VAL_TRIGGER_SLOPE_NEGATIVE  -  A negative (falling) edge passing through the trigger level triggers the digitizer.

- IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE  -  A positive (rising) edge passing through the trigger level triggers the digitizer.

Default Value: IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE
    �    Specifies the trigger source to configure. 

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.     �    Specifies the trigger level. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_LEVEL attribute.

Unit: volts

Default Value: 1.0
   �}-   �  �    Instrument Handle                �>#����  �    Status                           �� 9� � �    Trigger Slope                    �l 9  �  �    Trigger Source                   � 9 � �  �    Trigger Level (volts)                  	                      bPositive IVIDIGITIZER_VAL_TRIGGER_SLOPE_POSITIVE Negative IVIDIGITIZER_VAL_TRIGGER_SLOPE_NEGATIVE    ""    1.0   V    This function configures the glitch trigger. A glitch trigger occurs when the trigger signal has a pulse with a width that is less than or greater than the glitch width. 

Specify which comparison criterion to use with the glitchCondition parameter. Use the glitchWidth parameter and glitchPolarity parameter to specify the glitch width and the polarity of the pulse, respectively. 

The trigger does not actually occur until the edge of a pulse that corresponds to the glitchWidth and glitchPolarity crosses the threshold specified in the triggerLevel parameter. This function affects instrument behavior only if the IVIDIGITIZER_ATTR_TRIGGER_TYPE attribute is IVIDIGITIZER_VAL_GLITCH_TRIGGER. 

Set the trigger type and trigger coupling before calling this function.

Note: This function is part of the IviDigitizerGlitchTrigger [GT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source to configure. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.    �    Specifies the glitch polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_TRIGGER_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_GLITCH_POSITIVE  -  The digitizer triggers on a positive glitch.

- IVIDIGITIZER_VAL_GLITCH_NEGATIVE  -  The digitizer triggers on a negative glitch.

- IVIDIGITIZER_VAL_GLITCH_EITHER  -  The digitizer triggers on either a positive or negative glitch.

Default Value: IVIDIGITIZER_VAL_GLITCH_POSITIVE     �    Specifies the trigger level. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_LEVEL attribute.

Unit: volts

Default Value: 1.0     �    Specifies the glitch triggering glitch width, in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_TRIGGER_WIDTH attribute.

Unit: seconds

Default Value: 0.1    *    Specifies the glitch condition. The driver uses this value to set the IVIDIGITIZER_ATTR_GLITCH_TRIGGER_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_GLITCH_LESS_THAN  -  The digitizer triggers when the pulse width is less than the value you specify with the IVIDIGITIZER_ATTR_GLITCH_TRIGGER_WIDTH attribute.

- IVIDIGITIZER_VAL_GLITCH_GREATER_THAN  -  The digitizer triggers when the pulse width is greater than the value you specify with the IVIDIGITIZER_ATTR_GLITCH_TRIGGER_WIDTH attribute.

Default Value: IVIDIGITIZER_VAL_GLITCH_LESS_THAN   ��-   �  �    Instrument Handle                �g#����  �    Status                           �� 9  �  �    Trigger Source                   �� �  � �    Glitch Polarity                  �� 9 � �  �    Trigger Level (volts)            �@ 9� �  �    Glitch Width (sec)               �� � � � �    Glitch Condition                       	           ""               zPositive IVIDIGITIZER_VAL_GLITCH_POSITIVE Negative IVIDIGITIZER_VAL_GLITCH_NEGATIVE Either IVIDIGITIZER_VAL_GLITCH_EITHER    1.0    0.1               ^Less Than IVIDIGITIZER_VAL_GLITCH_LESS_THAN Greater Than IVIDIGITIZER_VAL_GLITCH_GREATER_THAN   I    This function configures the digitizer to trigger based on multiple trigger sources.

You can configure the digitizer to trigger when any one of multiple trigger source conditions are met or when all specified trigger source conditions are met.

Note: This function is part of the IviDigitizerMultiTrigger [MT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the Boolean operation to apply to the trigger sources specified by the sourceList parameter. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_SOURCE_OPERATOR attribute.

Valid Values:

- IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_AND  -  Use the AND Boolean operation for trigger sources. The digitizer triggers when all configured trigger source conditions are satisfied.

- IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_OR  -  Use the OR Boolean operation for trigger sources. The digitizer triggers when the first configured trigger source condition is satisfied.

- IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_NONE  -  No operator is applied to the configured list of trigger sources. The trigger source list is ignored, and the digitizer triggers when the active trigger source, specified by the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute, and its associated trigger conditions are satisfied.

Default Value: IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_AND
        Specifies a comma-separated list of source names to use in a multitrigger scenario. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_SOURCE_LIST attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the source name as a string variable or as a literal enclosed in double quotes.   �-   �  �    Instrument Handle                ��#����  �    Status                           �9 9H � �    Trigger Source Operator          � 9 H �  �    Source List                            	                      �And IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_AND Or IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_OR None IVIDIGITIZER_VAL_TRIGGER_SOURCE_OPERATOR_NONE    ""    �    This function configures the pretrigger samples of the digitizer.

Note: This function is part of the IviDigitizerPretriggerSamples [PS] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Specifies the number of samples that must be collected before a trigger event is recognized. The driver uses this value to set the IVIDIGITIZER_ATTR_PRETRIGGER_SAMPLES attribute.

Default Value: 1   �j-   �  �    Instrument Handle                �+#����  �    Status                           ٕ 9 � � �    Pretrigger Samples                     	           1   `    This function configures the runt trigger. A runt occurs when the trigger signal crosses one of the runt thresholds twice without crossing the other runt threshold.

Specify the runt threshold values with the thresholdLow and thresholdHigh parameters. Use the runtPolarity parameter to specify the polarity of the runt. 

This function affects instrument behavior only if the trigger type is runt trigger. Set the IVIDIGITIZER_ATTR_TRIGGER_TYPE and IVIDIGITIZER_ATTR_TRIGGER_COUPLING attributes before calling this function.

Note: This function is part of the IviDigitizerRuntTrigger [RT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.    �    Sets the runt polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_RUNT_TRIGGER_POLARITY attribute.


Valid Values:

- IVIDIGITIZER_VAL_RUNT_POSITIVE  -  The digitizer triggers on a positive runt. A positive runt occurs when a rising edge crosses the low runt threshold and does not cross the high runt threshold before re-crossing the low runt threshold.

- IVIDIGITIZER_VAL_RUNT_NEGATIVE  -  The digitizer triggers on a negative runt. A negative runt occurs when a falling edge crosses the high runt threshold and does not cross the low runt threshold before re-crossing the high runt threshold.

- IVIDIGITIZER_VAL_RUNT_EITHER  -  The digitizer triggers on either a positive or negative runt.

Default Value: IVIDIGITIZER_VAL_RUNT_POSITIVE     �    Sets the runt triggering low threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_RUNT_TRIGGER_LOW_THRESHOLD attribute.

Unit: volts

Default Value: 1.0
     �    Sets the runt triggering high threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_RUNT_TRIGGER_HIGH_THRESHOLD attribute.

Unit: volts

Default Value: 1.0
   �-   �  �    Instrument Handle                �@#����  �    Status                           � 9  �  �    Trigger Source                   � �  � �    Runt Polarity                    � 9 � �  �    Threshold Low (volts)            �Y 9� �  �    Threshold High (volts)                 	           ""               tPositive IVIDIGITIZER_VAL_RUNT_POSITIVE Negative IVIDIGITIZER_VAL_RUNT_NEGATIVE Either IVIDIGITIZER_VAL_RUNT_EITHER    1.0    1.0    �    This function configures the trigger holdoff of the digitizer.

Note: This function is part of the IviDigitizerTriggerHoldoff [TH] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Specifies the length of time the digitizer waits after it detects a trigger until the digitizer enables the trigger subsystem to detect another trigger. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_HOLDOFF attribute.

Unit: seconds

Default Value: 0.0   �-   �  �    Instrument Handle                �Y#����  �    Status                           �� 9 � �  �    Trigger Holdoff (sec)                  	           0.0    �    This function configures the trigger modifier of the digitizer.

Note: This function is part of the IviDigitizerTriggerModifier [TM] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the method the digitizer uses in the absence of trigger conditions. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_MODIFIER attribute.

Valid Values:

- IVIDIGITIZER_VAL_TRIGGER_MODIFIER_NONE  -  The digitizer waits until the trigger the end-user specifies occurs.

- IVIDIGITIZER_VAL_TRIGGER_MODIFIER_AUTO  -  The digitizer automatically triggers if the configured trigger does not occur within the digitizer timeout period.

- IVIDIGITIZER_VAL_TRIGGER_MODIFIER_AUTO_LEVEL  -  The digitizer adjusts the trigger level if the trigger the end-user specifies does not occur.

Default Value: IVIDIGITIZER_VAL_TRIGGER_MODIFIER_NONE   �0-   �  �    Instrument Handle                ��#����  �    Status                           [ 9 � � �    Trigger Modifier                       	                      �No Trigger Modifier IVIDIGITIZER_VAL_TRIGGER_MODIFIER_NONE Auto IVIDIGITIZER_VAL_TRIGGER_MODIFIER_AUTO Auto Level IVIDIGITIZER_VAL_TRIGGER_MODIFIER_AUTO_LEVEL   �    This function configures the digitizer for TV triggering. This function configures the TV signal format, the trigger event, and the signal polarity.

This function affects instrument behavior only if the trigger type is TV trigger. Set the IVIDIGITIZER_ATTR_TRIGGER_TYPE and IVIDIGITIZER_ATTR_TRIGGER_COUPLING attributes before calling this function.

Note: This function is part of the IviDigitizerTVTrigger [TVT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.    {    Specifies the polarity of the TV trigger signal. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_TRIGGER_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_TV_POSITIVE  -  The digitizer triggers on a positive video sync pulse.

- IVIDIGITIZER_VAL_TV_NEGATIVE  -  The digitizer triggers on a negative video sync pulse.

Default Value: IVIDIGITIZER_VAL_TV_POSITIVE    �    Specifies the TV trigger signal format. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_TRIGGER_SIGNAL_FORMAT attribute.

Valid Values:

- IVIDIGITIZER_VAL_NTSC  -  The digitizer triggers on the NTSC signal format.

- IVIDIGITIZER_VAL_PAL  -  The digitizer triggers on the PAL signal format

- IVIDIGITIZER_VAL_SECAM  -  The digitizer triggers on the SECAM signal format

Default Value: IVIDIGITIZER_VAL_NTSC    �    Specifies the TV trigger event. The driver uses this value to set the IVIDIGITIZER_ATTR_TV_TRIGGER_EVENT attribute.

Valid Values:

- IVIDIGITIZER_VAL_TV_EVENT_FIELD1  -  The digitizer triggers on field 1 of the video signal.

- IVIDIGITIZER_VAL_TV_EVENT_FIELD2  -  The digitizer triggers on field 2 of the video signal.

- IVIDIGITIZER_VAL_TV_EVENT_ANY_FIELD  -  The digitizer triggers on any field.

- IVIDIGITIZER_VAL_TV_EVENT_ANY_LINE  -  The digitizer triggers on any line.

- IVIDIGITIZER_VAL_TV_EVENT_LINE_NUMBER  -  The digitizer triggers on a specific line number you specify with the IVIDIGITIZER_ATTR_TV_TRIGGER_LINE_NUMBER attribute.

Default Value: IVIDIGITIZER_VAL_TV_EVENT_FIELD1   -   �  �    Instrument Handle                �#����  �    Status                           3 9  �  �    Trigger Source                   * �  � �    TV Polarity                      � 9 � � �    Signal Format                    Z 9� � �    Trigger Event                          	           ""               LPositive IVIDIGITIZER_VAL_TV_POSITIVE Negative IVIDIGITIZER_VAL_TV_NEGATIVE               QNTSC IVIDIGITIZER_VAL_NTSC PAL IVIDIGITIZER_VAL_PAL SECAM IVIDIGITIZER_VAL_SECAM               �Field1 IVIDIGITIZER_VAL_TV_EVENT_FIELD1 Field2 IVIDIGITIZER_VAL_TV_EVENT_FIELD2 Any Field IVIDIGITIZER_VAL_TV_EVENT_ANY_FIELD Any Line IVIDIGITIZER_VAL_TV_EVENT_ANY_LINE Line Number IVIDIGITIZER_VAL_TV_EVENT_LINE_NUMBER       This function configures the width trigger.

A width trigger occurs when a pulse that passes through the trigger level with a width between or outside the width thresholds is detected.

Note: This function is part of the IviDigitizerWidthTrigger [WT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.        Sets the width polarity. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_POLARITY attribute.

Valid Values:

- IVIDIGITIZER_VAL_WIDTH_POSITIVE  -  The digitizers triggers on positive pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_CONDITION attribute.

- IVIDIGITIZER_VAL_WIDTH_NEGATIVE  -  The digitizer triggers on negative pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_CONDITION attribute.

- IVIDIGITIZER_VAL_WIDTH_EITHER  -  The digitizer triggers on either positive or negative pulses that have a width that meets the condition specified with the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_CONDITION attribute.

Default Value: IVIDIGITIZER_VAL_WIDTH_POSITIVE     �    Specifies the trigger level. The driver uses this value to set the IVIDIGITIZER_ATTR_TRIGGER_LEVEL attribute.

Unit: volts

Default Value: 1.0    �    Specifies whether a pulse that is within or outside the specified thresholds triggers waveform acquisition. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_WIDTH_WITHIN  -  The digitizer triggers on pulses that have a width that is less than the high threshold and greater than the low threshold. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WIDTH_TRIGGER_LOW_THRESHOLD attributes, respectively.

- IVIDIGITIZER_VAL_WIDTH_OUTSIDE  -  The digitizer triggers on pulses that have a width that is either greater than the high threshold or less than a low threshold. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WIDTH_TRIGGER_LOW_THRESHOLD attributes, respectively.

Default Value: IVIDIGITIZER_VAL_WIDTH_WITHIN     �    Sets the width triggering low threshold, in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_LOW_THRESHOLD attribute.

Unit: volts

Default Value: 1.0     �    Sets the width triggering high threshold, in seconds. The driver uses this value to set the IVIDIGITIZER_ATTR_WIDTH_TRIGGER_HIGH_THRESHOLD attribute.

Unit: volts

Default Value: 1.0   )-   �  �    Instrument Handle                �#����  �    Status                           #T 9  �  �    Trigger Source                   %K � � � �    Width Polarity                   (d 9 � �  �    Trigger Level (volts)            (� �� � �    Width Condition                  ,� 9� �  �    Threshold Low (volts)            -^ �  �  �    Threshold High (volts)                 	           ""               wPositive IVIDIGITIZER_VAL_WIDTH_POSITIVE Negative IVIDIGITIZER_VAL_WIDTH_NEGATIVE Either IVIDIGITIZER_VAL_WIDTH_EITHER    1.0               LWithin IVIDIGITIZER_VAL_WIDTH_WITHIN Outside IVIDIGITIZER_VAL_WIDTH_OUTSIDE    1.0    1.0    �    This function configures the window trigger.

A window trigger occurs when a signal that enters or leaves a given voltage range is detected.

Note: This function is part of the IviDigitizerWindowTrigger [WINT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the trigger source to configure. The driver uses this value to set the IVIDIGITIZER_ATTR_ACTIVE_TRIGGER_SOURCE attribute.

Users who want to achieve interchangeability should use a virtual trigger source name. The virtual trigger source name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical trigger source name.

Default Value: ""

Note: You can specify the trigger source name as a string variable or as a literal enclosed in double quotes.    �    Specifies whether a signal that is entering or leaving the voltage window defined by the high and low thresholds triggers the digitizer. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_TRIGGER_CONDITION attribute.

Valid Values:

- IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING  -  The digitizer triggers on signals when they enter the given triggering window. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WINDOW_TRIGGER_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WINDOW_TRIGGER_LOW_THRESHOLD attributes, respectively.

- IVIDIGITIZER_VAL_WINDOW_CONDITION_LEAVING  -  The digitizer triggers on signals when they leave the given triggering window. Specify the high and low thresholds with the IVIDIGITIZER_ATTR_WINDOW_TRIGGER_HIGH_THRESHOLD and IVIDIGITIZER_ATTR_WINDOW_TRIGGER_LOW_THRESHOLD attributes, respectively.

Default Value: IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING     �    Sets the window triggering low threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_TRIGGER_LOW_THRESHOLD attribute.

Unit: volts

Default Value: 1.0     �    Sets the window triggering high threshold, in volts. The driver uses this value to set the IVIDIGITIZER_ATTR_WINDOW_TRIGGER_HIGH_THRESHOLD attribute.

Unit: volts

Default Value: 1.0   1�-   �  �    Instrument Handle                2#����  �    Status                           9� 9  �  �    Trigger Source                   ;� �  � �    Windows Condition                ?z 9 � �  �    Threshold Low (volts)            @8 9� �  �    Threshold High (volts)                 	           ""               fEntering IVIDIGITIZER_VAL_WINDOW_CONDITION_ENTERING Leaving IVIDIGITIZER_VAL_WINDOW_CONDITION_LEAVING    1.0    1.0   �    This function returns the specific driver defined trigger source name that corresponds to the specified one-based index.

If the driver defines a qualified trigger source name, this function returns the qualified name.

If the value you pass for the sourceIndex parameter is less than one or greater than the value of the IVIDIGITIZER_ATTR_TRIGGER_SOURCE_COUNT attribute, the function returns an empty string in the sourceName parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     H    A one-based index that defines which name to return.

Default Value: 1     e    The number of bytes in the ViChar array specified for the sourceName parameter.

Default Value: 256     �    Returns the trigger source name that corresponds to the specified sourceIndex. 

The sourceName buffer must contain at least as many elements as the value you specify with the sourceNameBufferSize parameter.
   D�-   �  �    Instrument Handle                Es#����  �    Status                           N� 9  �  �    Source Index                     N� 9 � �  �    Source Name Buffer Size          OM 9� �  �    Source Name                            	           1    256    	           �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    =    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
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
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   V%-   �  �    Instrument Handle                V�#����  �    Status                           ^P � � �  �    Attribute Value                 ���� � ���                                          `i = � � �    Attribute ID                     e� =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViInt64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.
     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    =    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt64 type.  
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   m�-   �  �    Instrument Handle                n�#����  �    Status                           v& � � �  �    Attribute Value                 ���� � ���                                          x? = � � �    Attribute ID                     }� =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    <    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type. If you choose to see all IVI attributes, the data types
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
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          � = � � �    Attribute ID                     �\ =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    <    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type. If you choose to see all IVI attributes, the data types
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
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   ��-   �  �    Instrument Handle                �m#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     �4 =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    >    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type. If you choose to see all IVI attributes, the data types
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
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
   ��-   �  �    Instrument Handle                �F#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     � =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes. It is best to use the high-level driver functions as much as possible. They handle order dependencies and multithread locking for you. In addition, they perform status checking only after setting all of the attributes. In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change. Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    >    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
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
   �`-   �  �    Instrument Handle                �!#����  �    Status                           Ջ � � �  �    Attribute Value                  פ =  �  �    Repeated Capability Name         ً = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Returns the current value of the attribute. Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
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
   �(-   �  �    Instrument Handle                ��#����  �    Status                           �S � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name         �� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViInt64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Returns the current value of the attribute. Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt64 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   ��-   �  �    Instrument Handle                �L#����  �    Status                           �� � � �  �    Attribute Value                  �q =  �  �    Repeated Capability Name         X = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Returns the current value of the attribute. Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""

    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type. If you choose to see all IVI attributes, the data types
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
   �-   �  �    Instrument Handle                	�#����  �    Status                            � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name         � = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value. You pass the number of bytes in the buffer as the Buffer Size parameter. If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer. 

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter. 

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviDigitizer_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    "    The buffer in which the function returns the current value of the attribute. The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter. 

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Attribute Value buffer parameter.

Default Value: 512    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type. If you choose to see all IVI attributes, the data types
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
   !i-   �  �    Instrument Handle                "*#����  �    Status or Required Size          +G � L � �    Attribute Value                  /q =  �  �    Repeated Capability Name         1X =� �  �    Buffer Size                      4L = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Returns the current value of the attribute. Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type. If you choose to see all IVI attributes, the data types
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
   <!-   �  �    Instrument Handle                <�#����  �    Status                           DL � � �  �    Attribute Value                  F	 =  �  �    Repeated Capability Name         G� = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes. If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Returns the current value of the attribute. Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control. 
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>. 
    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""

    �    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Help text is
  shown for each attribute. Select an attribute by 
  double-clicking on it or by selecting it and then pressing
  <ENTER>.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
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
   O�-   �  �    Instrument Handle                PL#����  �    Status                           W� � � �  �    Attribute Value                  Ys =  �  �    Repeated Capability Name         [[ = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""

    <    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
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
   a�-   �  �    Instrument Handle                bT#����  �    Status                           i� � � �  �    Attribute Value                  k� =  �  �    Repeated Capability Name        ���� � ���                                          m� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    S    This function checks the validity of a value you specify for a ViInt64 attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""

    <    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViInt64 type. 
  If you choose to see all IVI attributes, the data types appear
  to the right of the attribute names in the list box. 
  Attributes with data types other than ViInt64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   u-   �  �    Instrument Handle                u�#����  �    Status                           }9 � � �  �    Attribute Value                  g =  �  �    Repeated Capability Name        ���� � ���                                          �O = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""

    =    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViReal64
  type. If you choose to see all IVI attributes, the data types
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
   ��-   �  �    Instrument Handle                �K#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    =    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViString
  type. If you choose to see all IVI attributes, the data types
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
   �-   �  �    Instrument Handle                ��#����  �    Status                           �2 � � �  �    Attribute Value                  �` =  �  �    Repeated Capability Name        ���� � ���                                          �G = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    ?    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViBoolean
  type. If you choose to see all IVI attributes, the data types
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
   ��-   �  �    Instrument Handle                �E#����  �    Status                           �� � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    &    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control. Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>. 

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    �    If the attribute applies to a repeated capability such as a trace or channel, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not apply to a repeated capability, then pass VI_NULL or an empty string.

This control accepts either a virtual repeated capability name or an instrument-specific name. For valid repeated capability names, refer to your configuration settings in MAX.

Default Value:  ""
    ?    Pass the ID of an attribute.

From the function panel window, you can use this control as follows.

- Click on the control or press <ENTER>, <spacebar>, or
  <ctrl-down arrow>, to display a dialog box containing a
  hierarchical list of the available attributes. Attributes 
  whose value cannot be set are dim. Help text is shown for 
  each attribute. Select an attribute by double-clicking on it  
  or by selecting it and then pressing <ENTER>.

  Read-only attributes appear dim in the list box. If you 
  select a read-only attribute, an error message appears.

  A ring control at the top of the dialog box allows you to see 
  all IVI attributes or only the attributes of the ViSession
  type. If you choose to see all IVI attributes, the data types
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
   �-   �  �    Instrument Handle                ��#����  �    Status                           �. � � �  �    Attribute Value                  �\ =  �  �    Repeated Capability Name        ���� � ���                                          �C = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   k    This function initiates an acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. 

If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error. The function then waits for the acquisition to complete and returns the waveform for the specified channel.

If the digitizer does not complete the acquisition within the time period specified with the maximumTime parameter, the function returns the Max Time Exceeded error.

Call one of the IviDigitizer_FetchWaveform functions to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition. After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

If the IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE attribute set for the acquisition is not equal to one, this function returns an error. You must use the IviDigitizer_InitiateAcquisition function and the Fetch Multi-Record Waveform functions in this case.

The data type of the returned waveform array is ViInt16.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the maximum time allowed for this method to complete, in milliseconds. The values defined in IviDigitizerTimeOutEnum are also allowed.

Unit: milliseconds

Default Value: 5000     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    <    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieved, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the saveformArraySize parameter.    �    Indicates the index of the first valid data point in the output data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform, in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    g    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    j    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     ?    The time between points in the acquired waveform, in seconds.   ژ#����  �    Status                           � .  �  x    Channel Name                     � . � �  x    Maximum Time (ms)                �l-   �  �    Instrument Handle                �- .  �  x    Waveform Array Size              �q y  �  x    Actual Points                    �� .� �  x    Waveform Array                   � y � �  x    First Valid Point                �[ �  �  x    Scale Factor                     � �� �  x    Scale Offset                     � y  �  x    Initial X Offset (sec)           � y� �  x    Initial X Time Seconds (sec)     �� �  	�  x    Initial X Time Fraction (sec)    �d � � 
�  x    X Increment (sec)                  	           ""    5000        256    	            	            	            	           	           	           	           	           	          k    This function initiates an acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. 

If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error. The function then waits for the acquisition to complete and returns the waveform for the specified channel.

If the digitizer does not complete the acquisition within the time period specified with the maximumTime parameter, the function returns the Max Time Exceeded error.

Call one of the IviDigitizer_FetchWaveform functions to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition. After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

If the IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE attribute set for the acquisition is not equal to one, this function returns an error. You must use the IviDigitizer_InitiateAcquisition function and the Fetch Multi-Record Waveform functions in this case.

The data type of the returned waveform array is ViInt32.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the maximum time allowed for this method to complete, in milliseconds. The values defined in IviDigitizerTimeOutEnum are also allowed.

Unit: milliseconds

Default Value: 5000     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    <    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieved, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    �    Indicates the index of the first valid data point in the output data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform, in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    g    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    j    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     ?    The time between points in the acquired waveform, in seconds.   ��#����  �    Status                           �� .  �  x    Channel Name                     �� . � �  x    Maximum Time (ms)                �i-   �  �    Instrument Handle                 * .  �  x    Waveform Array Size              n y  �  x    Actual Points                    � .� �  x    Waveform Array                   � y � �  x    First Valid Point                X �  �  x    Scale Factor                     � �� �  x    Scale Offset                     � y  �  x    Initial X Offset (sec)           � y� �  x    Initial X Time Seconds (sec)     � �  	�  x    Initial X Time Fraction (sec)    a � � 
�  x    X Increment (sec)                  	           ""    5000        256    	            	            	            	           	           	           	           	           	          j    This function initiates an acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. 

If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error. The function then waits for the acquisition to complete and returns the waveform for the specified channel.

If the digitizer does not complete the acquisition within the time period specified with the maximumTime parameter, the function returns the Max Time Exceeded error.

Call one of the IviDigitizer_FetchWaveform functions to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition. After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

If the IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE attribute set for the acquisition is not equal to one, this function returns an error. You must use the IviDigitizer_InitiateAcquisition function and the Fetch Multi-Record Waveform functions in this case.

The data type of the returned waveform array is ViInt8.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the maximum time allowed for this method to complete, in milliseconds. The values defined in IviDigitizerTimeOutEnum are also allowed.

Unit: milliseconds

Default Value: 5000     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ;    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieve, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    �    Indicates the index of the first valid data point in the output data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform, in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    g    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    j    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     ?    The time between points in the acquired waveform, in seconds.   �#����  �    Status                           � .  �  x    Channel Name                     � . � �  x    Maximum Time (ms)                e-   �  �    Instrument Handle                & .  �  x    Waveform Array Size              i y  �  x    Actual Points                    � .� �  x    Waveform Array                   � y � �  x    First Valid Point                S �  �  x    Scale Factor                     � �� �  x    Scale Offset                     � y  �  x    Initial X Offset (sec)            { y� �  x    Initial X Time Seconds (sec)     !� �  	�  x    Initial X Time Fraction (sec)    #\ � � 
�  x    X Increment (sec)                  	           ""    5000        256    	            	            	            	           	           	           	           	           	          >    This function initiates an acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. 

If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error. The function then waits for the acquisition to complete and returns the waveform for the specified channel.

If the digitizer does not complete the acquisition within the time period specified with the maximumTime parameter, the function returns the Max Time Exceeded error.

Call one of the IviDigitizer_FetchWaveform functions to obtain the waveforms for each of the remaining enabled channels without initiating another acquisition. After this function executes, each element in the waveformArray parameter is the actual sampled voltage in volts.

If the IVIDIGITIZER_ATTR_NUM_RECORDS_TO_ACQUIRE attribute set for the acquisition is not equal to one, this function returns an error. You must use the IviDigitizer_InitiateAcquisition function and the Fetch Multi-Record Waveform functions in this case.

The data type of the returned waveform array is ViReal64.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    Specifies the maximum time allowed for this method to complete, in milliseconds. The values defined in IviDigitizerTimeOutEnum are also allowed.

Unit: milliseconds

Default Value: 5000     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    :    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retriev, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    �    Indicates the index of the first valid data point in the output data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     �    The time in relation to the trigger event of the first point in the waveform, in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    g    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    j    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     ?    The time between points in the acquired waveform, in seconds.   +`#����  �    Status                           2� .  �  x    Channel Name                     4q . � �  x    Maximum Time (ms)                54-   �  �    Instrument Handle                5� .  �  x    Waveform Array Size              77 y  �  x    Actual Points                    7� .� �  x    Waveform Array                   8] y � �  x    First Valid Point                :! y  �  x    Initial X Offset (sec)           :� y� �  x    Initial X Time Seconds (sec)     <Z �  	�  x    Initial X Time Fraction (sec)    =� � � 
�  x    X Increment (sec)                  	           ""    5000        256    	            	            	            	           	           	           	          �    This function aborts an acquisition and returns the digitizer to the Idle state.

Note: This function does not check the instrument status.  Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors   C -   �  �    Instrument Handle                C�#����  �    Status                                 	          5    This function returns the waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

Note: 

(1) You use the Initiate Acquisition function to start an acquisition on the channels that the end-user configures with the Configure Channel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

(2) You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchWaveformInt16 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the Wait For Acquisition Complete function to block the calling program until the acquisition is finished.

(3) You can call the Read Waveform Int16 function instead of the Initiate Acquisition function. The Read Waveform Int16 function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the waveform (as well as various waveform parameters) for the specified channel. You call this function to obtain the waveforms for each of the remaining channels.

(4) After this function executes, each element in the WaveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC). 

(5) This function does not check the instrument status. Typically, the end-user calls this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. The end-user uses the low-level functions to optimize one or more aspects of interaction with the instrument. Call the Error Query function at the conclusion of the sequence to check the instrument status.

(6) The data type of the returned waveform array is ViInt16.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note:

You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    B    Specifies the allocated size of the WaveformArray buffer, in number of data points.

If this value is smaller than the total number of points to be retrieved, the driver will fill the waveform buffer as fully as possible and return the actual number of points retrieved in the ActualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

Note:

This array is always user allocated, and it must contain at least as many elements as the value you specify with the Waveform Array Size.    �    Indicates the index of the first valid data point in the output Data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    n    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    q    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     >    The time between points in the acquired waveform in seconds.   R�#����  �    Status                           ZL .  �  x    Channel Name                     [�-   �  �    Instrument Handle                \� . � �  x    Waveform Array Size              ]� .� �  x    Actual Points                    ^U . �  x    Waveform Array                   _$ y  �  x    First Valid Point                `� � � 
�  x    Scale Factor                     a � �  x    Scale Offset                     aF y � �  x    Initial X Offset (sec)           b y �  x    Initial X Time Seconds (sec)     c� y� �  x    Initial X Time Fraction (sec)    d� �  	�  x    X Increment (sec)                  	           ""        256    	            	            	            	           	           	           	           	           	          5    This function returns the waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

Note: 

(1) You use the Initiate Acquisition function to start an acquisition on the channels that the end-user configures with the Configure Channel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

(2) You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchWaveformInt32 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the Wait For Acquisition Complete function to block the calling program until the acquisition is finished.

(3) You can call the Read Waveform Int32 function instead of the Initiate Acquisition function. The Read Waveform Int32 function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the waveform (as well as various waveform parameters) for the specified channel. You call this function to obtain the waveforms for each of the remaining channels.

(4) After this function executes, each element in the WaveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC). 

(5) This function does not check the instrument status. Typically, the end-user calls this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. The end-user uses the low-level functions to optimize one or more aspects of interaction with the instrument. Call the Error Query function at the conclusion of the sequence to check the instrument status.

(6) The data type of the returned waveform array is ViInt32.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note:

You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    B    Specifies the allocated size of the WaveformArray buffer, in number of data points.

If this value is smaller than the total number of points to be retrieved, the driver will fill the waveform buffer as fully as possible and return the actual number of points retrieved in the ActualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

Note:

This array is always user allocated, and it must contain at least as many elements as the value you specify with the Waveform Array Size.    �    Indicates the index of the first valid data point in the output Data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    n    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    q    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     >    The time between points in the acquired waveform in seconds.   o�#����  �    Status                           w% .  �  x    Channel Name                     x�-   �  �    Instrument Handle                y� . � �  x    Waveform Array Size              z� .� �  x    Actual Points                    {. . �  x    Waveform Array                   {� y  �  x    First Valid Point                }� � � 
�  x    Scale Factor                     }� � �  x    Scale Offset                     ~ y � �  x    Initial X Offset (sec)           ~� y �  x    Initial X Time Seconds (sec)     �^ y� �  x    Initial X Time Fraction (sec)    �� �  	�  x    X Increment (sec)                  	           ""        256    	            	            	            	           	           	           	           	           	          1    This function returns the waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

Note: 

(1) You use the Initiate Acquisition function to start an acquisition on the channels that the end-user configures with the Configure Channel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

(2) You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchWaveformInt8 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the Wait For Acquisition Complete function to block the calling program until the acquisition is finished.

(3) You can call the Read Waveform Int8 function instead of the Initiate Acquisition function. The Read Waveform Int8 function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the waveform (as well as various waveform parameters) for the specified channel. You call this function to obtain the waveforms for each of the remaining channels.

(4) After this function executes, each element in the WaveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC). 

(5) This function does not check the instrument status. Typically, the end-user calls this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. The end-user uses the low-level functions to optimize one or more aspects of interaction with the instrument. Call the Error Query function at the conclusion of the sequence to check the instrument status.

(6) The data type of the returned waveform array is ViInt8.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note:

You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    B    Specifies the allocated size of the WaveformArray buffer, in number of data points.

If this value is smaller than the total number of points to be retrieved, the driver will fill the waveform buffer as fully as possible and return the actual number of points retrieved in the ActualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

Note:

This array is always user allocated, and it must contain at least as many elements as the value you specify with the Waveform Array Size.    �    Indicates the index of the first valid data point in the output Data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.     �    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    n    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    q    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     >    The time between points in the acquired waveform in seconds.   ��#����  �    Status                           �� .  �  x    Channel Name                     ��-   �  �    Instrument Handle                �c . � �  x    Waveform Array Size              �� .� �  x    Actual Points                    � . �  x    Waveform Array                   �� y  �  x    First Valid Point                �� � � 
�  x    Scale Factor                     �� � �  x    Scale Offset                     �� y � �  x    Initial X Offset (sec)           �� y �  x    Initial X Time Seconds (sec)     �3 y� �  x    Initial X Time Fraction (sec)    �� �  	�  x    X Increment (sec)                  	           ""        256    	            	            	            	           	           	           	           	           	          �    This function returns the waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

Note: 

(1) You use the Initiate Acquisition function to start an acquisition on the channels that the end-user configures with the Configure Channel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

(2) You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchWaveformReal64 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the Wait For Acquisition Complete function to block the calling program until the acquisition is finished.

(3) You can call the Read Waveform Real64 function instead of the Initiate Acquisition function. The Read Waveform Real64 function starts an acquisition on all enabled channels, waits for the acquisition to complete, and returns the waveform (as well as various waveform parameters) for the specified channel. You call this function to obtain the waveforms for each of the remaining channels.

(4) After completion each element in the WaveformArray parameter is the actual sampled voltage in Volts. 

(5) This function does not check the instrument status. Typically, the end-user calls this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. The end-user uses the low-level functions to optimize one or more aspects of interaction with the instrument. Call the Error Query function at the conclusion of the sequence to check the instrument status.

(6) The data type of the returned waveform array is ViReal64.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note:

You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    B    Specifies the allocated size of the WaveformArray buffer, in number of data points.

If this value is smaller than the total number of points to be retrieved, the driver will fill the waveform buffer as fully as possible and return the actual number of points retrieved in the ActualPoints parameter.

Default Value: 256     N    Indicates how many data points were actually retrieved from the instrument.
     �    Buffer into which the acquired waveform is stored. 

Note:

This array is always user allocated, and it must contain at least as many elements as the value you specify with the Waveform Array Size.    �    Indicates the index of the first valid data point in the output Data array. This value will often be zero. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates.     �    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event.    n    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.    q    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

Note:

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time.     >    The time between points in the acquired waveform in seconds.   �2#����  �    Status                           �� .  �  x    Channel Name                     �D-   �  �    Instrument Handle                � . � �  x    Waveform Array Size              �O .� �  x    Actual Points                    �� . �  x    Waveform Array                   �t y  �  x    First Valid Point                �8 y � �  x    Initial X Offset (sec)           � y �  x    Initial X Time Seconds (sec)     �w y� �  x    Initial X Time Fraction (sec)    �� �  	�  x    X Increment (sec)                  	           ""        256    	            	            	            	           	           	           	          �    This function initiates a waveform acquisition. After you call this function, the digitizer leaves the Idle state and waits for a trigger. The digitizer acquires a waveform for each channel the enabled with the IviDigitizer_ConfigureChannel function.

Note: This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence. 

     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors   ��-   �  �    Instrument Handle                �S#����  �    Status                                 	           K    This function determines if the digitizer is currently in the Idle state.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors        Returns whether the digitizer is currently in the Idle state. If the driver cannot query the instrument to determine its state, the driver returns the Unknown value.

Defined Values:

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_TRUE  -  The digitizer is currently in the Idle state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_FALSE  -  The digitizer is not currently in the Idle state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_UNKNOWN  -  The driver cannot query the instrument to determine if the digitizer is in the Idle state.   Ɋ-   �  �    Instrument Handle                �K#����  �    Status                           ѵ 9 � �  �    Status                                 	           	            P    This function determines if the digitizer is currently in the Measuring state.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    0    Returns whether the digitizer is currently in the Measuring state. If the driver cannot query the instrument to determine its state, the driver returns the Unknown value.

Defined Values:

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_TRUE  -  The digitizer is currently in the Measuring state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_FALSE  -  The digitizer is not currently in the Measuring state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_UNKNOWN  -  The driver cannot query the instrument to determine if the digitizer is in the Measuring state.   ��-   �  �    Instrument Handle                խ#����  �    Status                           � 9 � �  �    Status                                 	           	            V    This function determines if the digitizer is currently in the Waiting For Arm state.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    H    Returns whether the digitizer is currently in the Waiting For Arm state. If the driver cannot query the instrument to determine its state, the driver returns the Unknown value.

Defined Values:

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_TRUE  -  The digitizer is currently in the Waiting For Arm state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_FALSE  -  The digitizer is not currently in the Waiting For Arm state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_UNKNOWN  -  The driver cannot query the instrument to determine if the digitizer is in the Waiting For Arm state.   �h-   �  �    Instrument Handle                �)#����  �    Status                           � 9 � �  �    Status                                 	           	            Z    This function determines if the digitizer is currently in the Waiting For Trigger state.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    X    Returns whether the digitizer is currently in the Waiting For Trigger state. If the driver cannot query the instrument to determine its state, the driver returns the Unknown value.

Defined Values:

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_TRUE  -  The digitizer is currently in the Waiting For Trigger state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_FALSE  -  The digitizer is not currently in the Waiting For Trigger state.

- IVIDIGITIZER_VAL_ACQUISITION_STATUS_RESULT_UNKNOWN  -  The driver cannot query the instrument to determine if the digitizer is in the Waiting For Trigger state.   � -   �  �    Instrument Handle                ��#����  �    Status                           �+ 9 � �  �    Status                                 	           	           -    This function determines the minimum amount of memory that is needed to fetch or read data from the digitizer with maximum performance. 

The returned value includes the memory needed to handle DMA alignment issues and any internal memory that is used by the digitizer hardware or the driver. 

The parameters to this function are similar to the parameters used in Read and Fetch functions. Call this function before allocating data buffer memory, and then call a Read or Fetch function with the same parameter values. 


Note:

This function returns a value that you can use to allocate the optimally sized memory buffer for Read and Fetch calls with the same parameter values you passed to this function. If the Read and Fetch calls specify fewer data points, the data buffer is still large enough and there is no performance penalty, aside from wasted memory space. If the Read and Fetch calls specify more data points, those function calls fill the allocated memory buffer as fully as possible. You can make subsequent Fetch calls to retrieve the remaining data.
     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Specifies the size of the sampled data to retrieve. The value of this parameter must be 8, 16, 32 or 64, corresponding to the intended Read or Fetch function.


Valid Values:
Int8   -  8
Int16  -  16
Int32  -  32
Real64 -  64

Default Value: 64     D    Specifies the number of data points to return.

Default Value: 256     <    Specifies the number of records to read.

Default Value: 1     u    Specifies the start index within the record from which the data should be retrieved.

Unit: volts

Default Value: 0     {    Returns the minimum buffer size, in samples, needed for a subsequent Read or Fetch call with the same readout parameters.   �{-   �  �    Instrument Handle                �<#����  �    Status                           � 9  � �    Data Width                       � �  � �    Numer of Points Per Record       � 9 � �  �    Number of Records                4 9� �  �    Offset Within Record             � � � � �    Numer of Samples                       	                     #Int8 8 Int16 16 Int32 32 Real64 64    256    1    0    	           �    This function sends a software-generated arm to the instrument. It is only applicable for instruments using interfaces or protocols that support an explicit arm function.

Because instruments interpret a software-generated arm in a wide variety of ways, the precise response from the instrument to this arm is not defined.

Ensure that this function does not use resources that are potentially shared by other devices, such as the VXI trigger lines). Use of such shared resources may have undesirable effects on other devices.

Make sure that this function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The arm source attribute must accept software arm as a valid setting for this function to work. If the arm source is not set to software arm, this function does nothing and returns the Arm Not Software error.

Note: This function is part of the IviDigitizerSoftwareArm [SA] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           R-   �  �    Instrument Handle                  	              �    This function sends a software-generated trigger to the instrument. It is applicable only for instruments using interfaces or protocols that support an explicit trigger function. For example, with GPIB this function can send a group execute trigger to the instrument. Other implementations might send a *TRG command.

Because instruments interpret a software-generated trigger in a wide variety of ways, the precise response from the instrument to this trigger is not defined. Note that SCPI details a possible implementation.

Ensure that this function does not use resources that are potentially shared by other devices, such as the VXI trigger lines). Use of such shared resources may have undesirable effects on other devices.

Make sure that this function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The trigger source attribute must accept software trigger as a valid setting for this function to work. If the trigger source is not set to software trigger, this function does nothing and returns the Trigger Not Software error.

Note: This function is part of the IviDigitizerSoftwareTrigger [ST] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   S#����  �    Status                           "�-   �  �    Instrument Handle                  	              +    This function waits until the configured acquisition is complete. If no acquisition is currently running, this function returns immediately. If the acquisition does not complete  within the time period specified with the maximumTime(ms) parameter, the function returns the Max Time Exceeded error.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Specifies the maximum time the to allow for this function to complete. The units are in milliseconds. 

Default Value: 5000 (ms)   %+-   �  �    Instrument Handle                %�#����  �    Status                           -V 8 � �  �    Maximum Time (ms)                      	           5000   
6    This function returns the multi-record waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

You can retrieve the acquired waveform records all together or in chunks. Specify the first record and the number of consecutive records to fetch. Note that the record number is zero-based and reset when you initiate a new acquisition; that is, record 0 is the first record of the last acquisition. The  actualRecords return parameter indicates how many of the requested records have actually completed successfully. The  actualPoints, firstValidPoint, initialXOffset, initialXTimeSeconds, and initialXTimeFraction return parameters have a value for each record, and therefore are arrays of size numOfRecords. However, if the value of actualRecords is smaller than the requested number of records, only the first actualRecords elements in these arrays are valid. If you pass a NULL pointer for any of these parameters, the driver ignores the parameter. 

The value of firstValidPoint is relative to the start of the waveform array, as shown in the following:

Sample i of record R = WaveformArray[FirstValidPoint[R]+i]

You must use the IviDigitizer_InitiateAcquisition function to start a multi-record (Num Record > 1) acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchMultiRecordWaveformInt16 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the IviDigitizer_WaitForAcquisitionComplete function to block the calling program until the acquisition is finished.

After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The data type of the returned waveform array is ViInt16.

Note: This function is part of the IviDigitizerMultiRecordAcquisition [MRA] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ;    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieve, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     �    Indicates how many data points were actually retrieved from the instrument for each completed record. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveform array size parameter.    w    Indicates the index of the first valid data point in the output data array for each completed record. This value will often be the record index (0 to actualRecords - 1) times numOfPointsPerRecord. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.    "    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated    �    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     ?    The time between points in the acquired waveform, in seconds.     H    Indicates how many records in the acquisition completed successfully.
     E    Specifies the number of the first record to read.

Default Value: 0    �    Specifies the number of consecutive records to read.

If numOfRecords is greater than one, this parameter allows full or partial data retrieval, depending on the values of the offsetWithinRecord and numPointsPerRecord parameters, from multiple digitizer records in a single fetch call. If numOfRecords is less than or equal to zero, the function returns an error.

Default Value: 256    �    Specifies the start index within the record from which to retrieve the data.

While normally zero, this parameter allows you to retrieve partial records. Data that comes before the offsetWithinRecord parameter will not be retrieved. This is perhaps most useful when retrieving very large data records because it allows records to be retrieved in several smaller chunks.

Default Value: 0     �    Specifies the number of data points to return.

This number can be larger than the amount of data available. Use the actualPoints parameter to determine how many data points were returned.

Default Value: 256   8�#����  �    Status                           @? (  �  x    Channel Name                     A�-   �  �    Instrument Handle                B� h � �  x    Waveform Array Size              C� �  	�  x    Actual Points                    D� h �  x    Waveform Array                   E� � � 
�  x    First Valid Point                H � �  x    Scale Factor                     H: �� �  x    Scale Offset                     Hi � �  x    Initial X Offset (sec)           I� �� �  x    Initial X Time Seconds (sec)     Kb �  �  x    Initial X Time Fraction (sec)    M5 � � �  x    X Increment (sec)                M| h� �  x    Actual Records                   M� ( � �  x    First Record                     N ( �  x    Num of Records                   O� (� �  x    Offset Within Record             Q/ h  �  x    Num of Points Per Record           	           ""        256    	            	            	            	           	           	            	            	            	           	            0    256    0    256   
6    This function returns the multi-record waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

You can retrieve the acquired waveform records all together or in chunks. Specify the first record and the number of consecutive records to fetch. Note that the record number is zero-based and reset when you initiate a new acquisition; that is, record 0 is the first record of the last acquisition. The  actualRecords return parameter indicates how many of the requested records have actually completed successfully. The  actualPoints, firstValidPoint, initialXOffset, initialXTimeSeconds, and initialXTimeFraction return parameters have a value for each record, and therefore are arrays of size numOfRecords. However, if the value of actualRecords is smaller than the requested number of records, only the first actualRecords elements in these arrays are valid. If you pass a NULL pointer for any of these parameters, the driver ignores the parameter. 

The value of firstValidPoint is relative to the start of the waveform array, as shown in the following:

Sample i of record R = WaveformArray[FirstValidPoint[R]+i]

You must use the IviDigitizer_InitiateAcquisition function to start a multi-record (Num Record > 1) acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchMultiRecordWaveformInt32 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the IviDigitizer_WaitForAcquisitionComplete function to block the calling program until the acquisition is finished.

After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The data type of the returned waveform array is ViInt32.

Note: This function is part of the IviDigitizerMultiRecordAcquisition [MRA] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ;    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieve, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     �    Indicates how many data points were actually retrieved from the instrument for each completed record. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    w    Indicates the index of the first valid data point in the output data array for each completed record. This value will often be the record index (0 to actualRecords - 1) times numOfPointsPerRecord. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.    "    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     ?    The time between points in the acquired waveform, in seconds.     H    Indicates how many records in the acquisition completed successfully.
     E    Specifies the number of the first record to read.

Default Value: 0    �    Specifies the number of consecutive records to read.

If numOfRecords is greater than one, this parameter allows full or partial data retrieval, depending on the values of the offsetWithinRecord and numPointsPerRecord parameters, from multiple digitizer records in a single fetch call. If numOfRecords is less than or equal to zero, the function returns an error.

Default Value: 256    �    Specifies the start index within the record from which to retrieve the data.

While normally zero, this parameter allows you to retrieve partial records. Data that comes before the offsetWithinRecord parameter will not be retrieved. This is perhaps most useful when retrieving very large data records because it allows records to be retrieved in several smaller chunks.

Default Value: 0     �    Specifies the number of data points to return.

This number can be larger than the amount of data available. Use the actualPoints parameter to determine how many data points were returned.

Default Value: 256   `�#����  �    Status                           h (  �  x    Channel Name                     i�-   �  �    Instrument Handle                j� h � �  x    Waveform Array Size              k� �  	�  x    Actual Points                    l� h �  x    Waveform Array                   mc � � 
�  x    First Valid Point                o� � �  x    Scale Factor                     p �� �  x    Scale Offset                     p@ � �  x    Initial X Offset (sec)           qj �� �  x    Initial X Time Seconds (sec)     s: �  �  x    Initial X Time Fraction (sec)    u � � �  x    X Increment (sec)                uT h� �  x    Actual Records                   u� ( � �  x    First Record                     u� ( �  x    Num of Records                   wz (� �  x    Offset Within Record             y h  �  x    Num of Points Per Record           	           ""        256    	            	            	            	           	           	            	            	            	           	            0    256    0    256   
4    This function returns the multi-record waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

You can retrieve the acquired waveform records all together or in chunks. Specify the first record and the number of consecutive records to fetch. Note that the record number is zero-based and reset when you initiate a new acquisition; that is, record 0 is the first record of the last acquisition. The  actualRecords return parameter indicates how many of the requested records have actually completed successfully. The  actualPoints, firstValidPoint, initialXOffset, initialXTimeSeconds, and initialXTimeFraction return parameters have a value for each record, and therefore are arrays of size numOfRecords. However, if the value of actualRecords is smaller than the requested number of records, only the first actualRecords elements in these arrays are valid. If you pass a NULL pointer for any of these parameters, the driver ignores the parameter. 

The value of firstValidPoint is relative to the start of the waveform array, as shown in the following:

Sample i of record R = WaveformArray[FirstValidPoint[R]+i]

You must use the IviDigitizer_InitiateAcquisition function to start a multi-record (Num Record > 1) acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchMultiRecordWaveformInt8 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the IviDigitizer_WaitForAcquisitionComplete function to block the calling program until the acquisition is finished.

After this function executes, each element in the waveformArray parameter is an unscaled value directly from the digitizer's analog-to-digital converter (ADC).

This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The data type of the returned waveform array is ViInt8.

Note: This function is part of the IviDigitizerMultiRecordAcquisition [MRA] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ;    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieve, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     �    Indicates how many data points were actually retrieved from the instrument for each completed record. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    w    Indicates the index of the first valid data point in the output data array for each completed record. This value will often be the record index (0 to actualRecords - 1) times numOfPointsPerRecord. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     '    Scaling factor for the waveform data.     '    Scaling offset for the waveform data.    #    The time in relation to the trigger event of the first point in the waveform, in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     ?    The time between points in the acquired waveform, in seconds.     H    Indicates how many records in the acquisition completed successfully.
     E    Specifies the number of the first record to read.

Default Value: 0    �    Specifies the number of consecutive records to read.

If numOfRecords is greater than one, this parameter allows full or partial data retrieval, depending on the values of the offsetWithinRecord and numPointsPerRecord parameters, from multiple digitizer records in a single fetch call. If numOfRecords is less than or equal to zero, the function returns an error.

Default Value: 256    �    Specifies the start index within the record from which the data should be retrieved.

While normally zero, this parameter allows you to retrieve partial records. Data that comes before the offsetWithinRecord parameter will not be retrieved. This is perhaps most useful when retrieving very large data records because it allows records to be retrieved in several smaller chunks.

Default Value: 0     �    Specifies the number of data points to return.

This number can be larger than the amount of data available. Use the actualPoints parameter to determine how many data points were returned.

Default Value: 256   ��#����  �    Status                           �� (  �  x    Channel Name                     ��-   �  �    Instrument Handle                �V h � �  x    Waveform Array Size              �� �  	�  x    Actual Points                    �i h �  x    Waveform Array                   �9 � � 
�  x    First Valid Point                �� � �  x    Scale Factor                     �� �� �  x    Scale Offset                     � � �  x    Initial X Offset (sec)           �A �� �  x    Initial X Time Seconds (sec)     � �  �  x    Initial X Time Fraction (sec)    �� � � �  x    X Increment (sec)                �+ h� �  x    Actual Records                   �{ ( � �  x    First Record                     �� ( �  x    Num of Records                   �Q (� �  x    Offset Within Record             �� h  �  x    Num of Points Per Record           	           ""        256    	            	            	            	           	           	            	            	            	           	            0    256    0    256   
    This function returns the multi-record waveform the digitizer acquired for the specified channel. The waveform is from a previously initiated acquisition.

You can retrieve the acquired waveform records all together or in chunks. Specify the first record and the number of consecutive records to fetch. Note that the record number is zero-based and reset when you initiate a new acquisition; that is, record 0 is the first record of the last acquisition. The  actualRecords return parameter indicates how many of the requested records have actually completed successfully. The  actualPoints, firstValidPoint, initialXOffset, initialXTimeSeconds, and initialXTimeFraction return parameters have a value for each record, and therefore are arrays of size numOfRecords. However, if the value of actualRecords is smaller than the requested number of records, only the first actualRecords elements in these arrays are valid. If you pass a NULL pointer for any of these parameters, the driver ignores the parameter. 

The value of firstValidPoint is relative to the start of the waveform array, as shown in the following:

Sample i of record R = WaveformArray[FirstValidPoint[R]+i]

You must use the IviDigitizer_InitiateAcquisition function to start a multi-record (Num Record > 1) acquisition on the channels configured with the IviDigitizer_ConfigureChannel function. The digitizer acquires waveforms on the concurrently enabled channels. If the channel is not enabled for the acquisition, this function returns the Channel Not Enabled error.

You can use the Acquisition Status function to determine when the acquisition is complete. You must call the FetchMultiRecordWaveformReal64 function separately for each enabled channel to obtain the waveforms. Alternatively, you can use the IviDigitizer_WaitForAcquisitionComplete function to block the calling program until the acquisition is finished.

After this function executes, each element in the waveformArray parameter is the actual sampled voltage, in volts.

This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. Use the low-level functions to optimize one or more aspects of interaction with the instrument. If you want to check the instrument status, call the IviDigitizer_error_query function at the conclusion of the sequence.

The data type of the returned waveform array is ViReal64.

Note: This function is part of the IviDigitizerMultiRecordAcquisition [MRA] extension group.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    �    Specifies the name of the channel from which to retrieve the data.

Users who want to achieve interchangeability should use a virtual channel name. The virtual channel name should be sufficiently specific to the test system such that it is unlikely to conflict with a physical channel name.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    ;    Specifies the allocated size of the waveformArray buffer, in number of data points.

If this value is smaller than the total number of points to retrieve, the driver fills the waveform buffer as fully as possible and returns the actual number of points retrieved in the actualPoints parameter.

Default Value: 256     �    Indicates how many data points were actually retrieved from the instrument for each completed record. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     �    Buffer into which the acquired waveform is stored. 

This array is always user allocated, and it must contain at least as many elements as the value you specify with the waveformArraySize parameter.    w    Indicates the index of the first valid data point in the output data array for each completed record. This value will often be the record index (0 to actualRecords - 1) times numOfPointsPerRecord. However, some digitizer hardware designs transfer data most efficiently when the data is aligned with specific memory address boundaries. In those cases, the hardware may return a few invalid data points at the beginning of a record. This eliminates the need to shift the data during the transfer, ensuring maximum data transfer rates. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    "    The time in relation to the trigger event of the first point in the waveform in seconds. Negative values mean that the first point in the waveform array was acquired before the trigger event. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the seconds portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.    �    Specifies the fractional portion of the absolute time at which the first data point was acquired. 

The actual time is the sum of the initialXTimeSeconds and initialXTimeFraction parameters. The time is specified as the sum of two values because a single double-precision floating-point number does not have sufficient range and resolution to specify the time. This array must be at least of size numOfRecords or a NULL pointer and is always user allocated.     ?    The time between points in the acquired waveform, in seconds.     H    Indicates how many records in the acquisition completed successfully.
     E    Specifies the number of the first record to read.

Default Value: 0    �    Specifies the number of consecutive records to read.

If numOfRecords is greater than one, this parameter allows full or partial data retrieval, depending on the values of the offsetWithinRecord and numPointsPerRecord parameters, from multiple digitizer records in a single fetch call. If numOfRecords is less than or equal to zero, the function returns an error.

Default Value: 256    �    Specifies the start index within the record from which to retrieve the data.

While normally zero, this parameter allows you to retrieve partial records. Data that comes before the offsetWithinRecord parameter will not be retrieved. This is perhaps most useful when retrieving very large data records because it allows records to be retrieved in several smaller chunks.

Default Value: 0     �    Specifies the number of data points to return.

This number can be larger than the amount of data available. Use the actualPoints parameter to determine how many data points were returned.

Default Value: 256   �:#����  �    Status                           �� (  �  x    Channel Name                     �K-   �  �    Instrument Handle                � h � �  x    Waveform Array Size              �O �  	�  x    Actual Points                    � h �  x    Waveform Array                   �� � � 
�  x    First Valid Point                �n � �  x    Initial X Offset (sec)           �� �� �  x    Initial X Time Seconds (sec)     �h �  �  x    Initial X Time Fraction (sec)    �; � � �  x    X Increment (sec)                Ă h� �  x    Actual Records                   �� ( � �  x    First Record                     � ( �  x    Num of Records                   ƨ (� �  x    Offset Within Record             �5 h  �  x    Num of Points Per Record           	           ""        256    	            	            	            	            	            	            	           	            0    256    0    256    �    This function configures the temperature units returned by the IVIDIGITIZER_ATTR_BOARD_TEMPERATURE and the IVIDIGITIZER_ATTR_CHANNEL_TEMPERATURE attributes.

Note: This function is part of the IviDigitizerBoardTemperature [BT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors    9    Temperature units used by the IVIDIGITIZER_ATTR_BOARD_TEMPERATURE and IVIDIGITIZER_ATTR_CHANNEL_TEMPERATURE attributes. The driver uses this value to set the IVIDIGITIZER_ATTR_TEMPERATURE_UNITS attribute.

Valid Values:

- IVIDIGITIZER_VAL_CELSIUS  -  Temperature values returned from the digitizer are in degrees Celsius.

- IVIDIGITIZER_VAL_FAHRENHEIT  -  Temperature values returned from the digitizer are in degrees Fahrenheit.

- IVIDIGITIZER_VAL_KELVIN  -  Temperature values returned from the digitizer are in kelvins.

Default Value: IVIDIGITIZER_VAL_CELSIUS
   ��-   �  �    Instrument Handle                β#����  �    Status                           � 9 � � �    Temperature Units                      	                      gCelsius IVIDIGITIZER_VAL_CELSIUS Fahrenheit IVIDIGITIZER_VAL_FAHRENHEIT Kelvin IVIDIGITIZER_VAL_KELVIN    �    This function queries the temperature of the entire board. The IVIDIGITIZER_ATTR_TEMPERATURE_UNITS attribute specifies the units of temperature used.

Note: This function is part of the IviDigitizerBoardTemperature [BT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Returns the current temperature of the entire board.

The IVIDIGITIZER_ATTR_TEMPERATURE_UNITS attribute specifies the units of temperature used.   �x-   �  �    Instrument Handle                �9#����  �    Status                           � 9 � � �    Board Temperature                      	           	           �    This function queries the temperature of a specific channel. The IVIDIGITIZER_ATTR_TEMPERATURE_UNITS attribute specifies the units of temperature used.

Note: This function is part of the IviDigitizerChannelTemperature [CT] extension group.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    Returns the current temperature of the channel.

The IVIDIGITIZER_ATTR_TEMPERATURE_UNITS attribute specifies the units of temperature used.     �    Specifies the name of the channel from which to read the temperature.

Default Value: ""

Note: You can specify the channel name as a string variable or as a literal enclosed in double quotes.
   ��-   �  �    Instrument Handle                �#����  �    Status                           � 9P � �    Channel Temperature              �� 9 P �  �    Channel Name                           	           	           ""   %    This function resets the instrument to a known state and sends initialization commands to the instrument. The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           �
-   �  �    Instrument Handle                  	               �    This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           H-   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   #����  �    Status                           
y-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    $    This control contains the value returned from the instrument self test. Zero means success. For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    9  �  �    Self Test Result                 B 9 � � ,    Self-Test Message                #����  �    Status                           v-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   � 9  �  �    Instrument Driver Revision       , 9Y �  �    Firmware Revision                �#����  �    Status                            !-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   "< 9  �  �    Error Code                       "� 9 � � ,    Error Message                    ##����  �    Status                           *�-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.      z    Pass the Status parameter that is returned from any of the instrument driver functions.

Default Value:  0  (VI_SUCCESS)     �    Returns the user-readable message string that corresponds to the status code you specify.

You must pass a ViChar array with at least 256 bytes.
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors         The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter. This is useful when one of the initialize functions fail.

Default Value:  VI_NULL
   ,� 9  �  h    Error Code                       -7 9 � � �    Error Message                    -�#����  �    Status                           5<-   �  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   7�#����  �    Status                           ?"-   �  �    Instrument Handle                  	               h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     Z    Returns the C session instrument handle you use to call the specific driver's functions.   @�-   �  �    Instrument Handle                A�#����  �    Status                           H� = � �  �    Specific Driver C Handle               	           	          �    This function returns the coercion information associated with the IVI session. This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIDIGITIZER_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions. You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init function. The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session. If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   N�#����  �    Status or Required Size          X-   �  �    Instrument Handle                X� � Q � �    Coercion Record                  [� 9 � �  �    Buffer Size                        	               	               �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session. If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread. If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviDigitizer_GetError or IviDigitizer_ClearError.
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread. If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   cw#����  �    Status or Required Size          l�-   �  �    Instrument Handle                mU 9A �  �    BufferSize                       p4 9 R �  �    Code                             p� � Q � �    Description                        	                   	           	           o    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS. If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviDigitizer_GetError function, which occurs when a call to IviDigitizer_init or IviDigitizer_InitWithOptions fails.    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   xl#����  �    Status                           �-   �  �    Instrument Handle                  	              2    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning. Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVIDIGITIZER_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    	    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   �K#����  �    Status or Required Size          �h-   �  �    Instrument Handle                �) 9 � �  �    Buffer Size                      �/ � Q � �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors   ��-   �  �    Instrument Handle                �P#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order. To do so requires ensuring that each test module completely configures the state of each instrument it uses. If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module. If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change. This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases. After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations. By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings. If you want to guarantee that the IviDigitizer_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings. You can clear the interchangeability warnings list by repeatedly calling the IviDigitizer_GetNextInterchangeWarning function until no more interchangeability warnings are returned. If you are not interested in the content of those warnings, you can call the IviDigitizer_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors   �	-   �  �    Instrument Handle                ��#����  �    Status                                 	          f    This function obtains a multithread lock on the instrument session. Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviDigitizer_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviDigitizer_LockSession returns successfully, no other threads can access the instrument session until you call IviDigitizer_UnlockSession.

Use IviDigitizer_LockSession and IviDigitizer_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviDigitizer_LockSession within the same thread. To completely unlock the session, you must balance each call to IviDigitizer_LockSession with a call to IviDigitizer_UnlockSession. If, however, you use the Caller Has Lock parameter in all calls to IviDigitizer_LockSession and IviDigitizer_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviDigitizer_LockSession. This allows you to call IviDigitizer_UnlockSession just once at the end of the function. 
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience. If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. Pass the address of a local ViBoolean variable. In the declaration of the local variable, initialize it to VI_FALSE. Pass the address of the same local variable to any other calls you make to IviDigitizer_LockSession or IviDigitizer_UnlockSession in the same function.

The parameter is an input/output parameter. IviDigitizer_LockSession and IviDigitizer_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDigitizer_LockSession does not lock the session again. If the value is VI_FALSE, IviDigitizer_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDigitizer_UnlockSession does not attempt to unlock the session. If the value is VI_TRUE, IviDigitizer_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviDigitizer_UnlockSession at the end of your function without worrying about whether you actually have the lock. 

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDigitizer_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDigitizer_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDigitizer_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock. Fortunately, the haveLock 
       variable takes care of that for you.         
    */
    IviDigitizer_UnlockSession(vi, &haveLock);
    return error;
}   �#����  �    Status                           ��-   �  �    Instrument Handle                �G 9 � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviDigitizer_LockSession. Refer to IviDigitizer_LockSession for additional information on session locks.
    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
    �    This parameter serves as a convenience. If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable. In the declaration of the local variable, initialize it to VI_FALSE. Pass the address of the same local variable to any other calls you make to IviDigitizer_LockSession or IviDigitizer_UnlockSession in the same function.

The parameter is an input/output parameter. IviDigitizer_LockSession and IviDigitizer_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviDigitizer_LockSession does not lock the session again. If the value is VI_FALSE, IviDigitizer_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviDigitizer_UnlockSession does not attempt to unlock the session. If the value is VI_TRUE, IviDigitizer_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviDigitizer_UnlockSession at the end of your function without worrying about whether you actually have the lock. 

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviDigitizer_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviDigitizer_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviDigitizer_LockSession(vi, &haveLock);
            } 
        if (flags & BIT_3)
            viCheckErr( TakeAction3(vi));
        }

Error:
    /* 
       At this point, you cannot really be sure that 
       you have the lock. Fortunately, the haveLock 
       variable takes care of that for you.         
    */
    IviDigitizer_UnlockSession(vi, &haveLock);
    return error;
}   ľ#����  �    Status                           �(-   �  �    Instrument Handle                �� 9 � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Note:

(1) You must unlock the session before calling IviDigitizer_close.

(2) After calling IviDigitizer_close, you cannot use the instrument driver again until you call IviDigitizer_init or IviDigitizer_InitWithOptions.

    b    Returns the status code of this operation. The status code either indicates success or describes an error or warning condition. You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, call the IviDigitizer_error_message function. To obtain additional information about the error condition, call the IviDigitizer_GetError function. To clear the error information from the driver, call the IviDigitizer_ClearError function.

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
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  The channel is not enabled.
BFFA2002  Maximum time exceeded before the operation completed.
BFFA2003  Arm source is not set to software arm.
BFFA2004  The multi-record acquisition fetch functions must be used if the number of records to acquire is greater than 1.
          
This instrument driver also returns errors and warnings defined by other sources. The following table defines the ranges of additional status codes that this driver can return. The table lists the different include files that contain the defined constants for the particular status codes:
          
Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI     Warnings
3FFF0000 to 3FFFFFFF     VISA    Warnings
3FFC0000 to 3FFCFFFF     VXIPnP  Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI     Errors
BFFF0000 to BFFFFFFF     VISA    Errors
BFFC0000 to BFFCFFFF     VXIPnP  Driver Errors     �    The ViSession handle that you obtain from the IviDigitizer_init or IviDigitizer_InitWithOptions function. The handle identifies a particular instrument session.

Default Value:  None
   �Z#����  �    Status                           ��-   �  �    Instrument Handle                  	            ����         �  '�             K.        init                                                                                                                                    ����         )  J             K.        InitWithOptions                                                                                                                         ����         K�  T�             K.        SelfCalibrate                                                                                                                           ����         Uk  `Z             K.        ConfigureAcquisition                                                                                                                    ����         a�  k�             K.        ConfigureSampleMode                                                                                                                     ����         l�  y&             K.        ConfigureDownconversion                                                                                                                 ����         zi  ��             K.        ConfigureEdgeArmSource                                                                                                                  ����         ��  �8             K.        ConfigureGlitchArmSource                                                                                                                ����         ��  ��             K.        ConfigureMultiArm                                                                                                                       ����         �5  �M             K.        ConfigureRuntArmSource                                                                                                                  ����         �2  ��             K.        ConfigureTVArmSource                                                                                                                    ����         ��  �y             K.        ConfigureWidthArmSource                                                                                                                 ����         �-  �             K.        ConfigureWindowArmSource                                                                                                                ����         ��              K.        GetArmSourceName                                                                                                                        ����        � �             K.        ConfigureChannel                                                                                                                        ����        � +�             K.        ConfigureInputFilter                                                                                                                    ����        - :D             K.        GetChannelName                                                                                                                          ����        ;u J�             K.        ConfigureDataInterleavedChannelList                                                                                                     ����        K� Z             K.        ConfigureTimeInterleavedChannelList                                                                                                     ����        [  g�             K.        ConfigureReferenceOscillator                                                                                                            ����        i� t             K.        ConfigureReferenceOscillatorOutputEnabled                                                                                               ����        t� �9             K.        ConfigureSampleClock                                                                                                                    ����        �� ��             K.        ConfigureSampleClockOutputEnabled                                                                                                       ����        �� ��             K.        ConfigureActiveTriggerSource                                                                                                            ����        �s ��             K.        ConfigureEdgeTriggerSource                                                                                                              ����        �H �0             K.        ConfigureGlitchTriggerSource                                                                                                            ����        �� �;             K.        ConfigureMultiTrigger                                                                                                                   ����        �� �c             K.        ConfigurePretriggerSamples                                                                                                              ����        � �             K.        ConfigureRuntTriggerSource                                                                                                              ����        �� ��             K.        ConfigureTriggerHoldoff                                                                                                                 ����        �� �             K.        ConfigureTriggerModifier                                                                                                                ����        O              K.        ConfigureTVTriggerSource                                                                                                                ����         .             K.        ConfigureWidthTriggerSource                                                                                                             ����        0� @�             K.        ConfigureWindowTriggerSource                                                                                                            ����        B� P'             K.        GetTriggerSourceName                                                                                                                    ����        QX g�             K.        SetAttributeViInt32                                                                                                                     ����        i0 k             K.        SetAttributeViInt64                                                                                                                     ����        � �C             K.        SetAttributeViReal64                                                                                                                    ����        �� �             K.        SetAttributeViString                                                                                                                    ����        �� ��             K.        SetAttributeViBoolean                                                                                                                   ����        ȑ ��             K.        SetAttributeViSession                                                                                                                   ����        �l �             K.        GetAttributeViInt32                                                                                                                     ����        �� �             K.        GetAttributeViInt64                                                                                                                     ����        2 \             K.        GetAttributeViReal64                                                                                                                    ����        � 8�             K.        GetAttributeViString                                                                                                                    ����        :c L�             K.        GetAttributeViBoolean                                                                                                                   ����        M� _�             K.        GetAttributeViSession                                                                                                                   ����        a8 s             K.        CheckAttributeViInt32                                                                                                                   ����        t� ��             K.        CheckAttributeViInt64                                                                                                                   ����        �. �             K.        CheckAttributeViReal64                                                                                                                  ����        �� ��             K.        CheckAttributeViString                                                                                                                  ����        �' �             K.        CheckAttributeViBoolean                                                                                                                 ����        ¦ Ԋ             K.        CheckAttributeViSession                                                                                                                 ����        �% ��             K.        ReadWaveformInt16                                                                                                                       ����        �" �             K.        ReadWaveformInt32                                                                                                                       ����         #�             K.        ReadWaveformInt8                                                                                                                        ����        ' >             K.        ReadWaveformReal64                                                                                                                      ����        A K+             K.        Abort                                                                                                                                   ����        K� eD             K.        FetchWaveformInt16                                                                                                                      ����        h~ �             K.        FetchWaveformInt32                                                                                                                      ����        �W ��             K.        FetchWaveformInt8                                                                                                                       ����        �, �6             K.        FetchWaveformReal64                                                                                                                     ����        �� Ƚ             K.        InitiateAcquisition                                                                                                                     ����        �7 ��             K.        IsIdle                                                                                                                                  ����        Ԕ �O             K.        IsMeasuring                                                                                                                             ����        �
 ��             K.        IsWaitingForArm                                                                                                                         ����        � ��             K.        IsWaitingForTrigger                                                                                                                     ����        �F 4             K.        QueryMinWaveformMemory                                                                                                                  ����                      K.        SendSoftwareArm                                                                                                                         ����        � #~             K.        SendSoftwareTrigger                                                                                                                     ����        #� -�             K.        WaitForAcquisitionComplete                                                                                                              ����        .� R	             K.        FetchMultiRecordWaveformInt16                                                                                                           ����        Vp y�             K.        FetchMultiRecordWaveformInt32                                                                                                           ����        ~H ��             K.        FetchMultiRecordWaveformInt8                                                                                                            ����        �' �             K.        FetchMultiRecordWaveformReal64                                                                                                          ����        �� �]             K.        ConfigureTemperatureUnits                                                                                                               ����        ق �=             K.        QueryBoardTemperature                                                                                                                   ����        �� �}             K.        QueryChannelTemperature                                                                                                                 ����        �s ��             K.        reset                                                                                                                                   ����        �E 	             K.        ResetWithDefaults                                                                                                                       ����        � :             K.        Disable                                                                                                                                 ����        � 7             K.        self_test                                                                                                                               ����        3  �             K.        revision_query                                                                                                                          ����        !� +C             K.        error_query                                                                                                                             ����        ,? 6d             K.        error_message                                                                                                                           ����        7` ?�             K.        InvalidateAllAttributes                                                                                                                 ����        @] IZ             K.        GetSpecificDriverCHandle                                                                                                                ����        J ^�             K.        GetNextCoercionRecord                                                                                                                   ����        _� s�             K.        GetError                                                                                                                                ����        t� ��             K.        ClearError                                                                                                                              ����        � �R             K.        GetNextInterchangeWarning                                                                                                               ����        �F ��             K.        ClearInterchangeWarnings                                                                                                                ����        �4 �4             K.        ResetInterchangeCheck                                                                                                                   ����        �� �A             K.        LockSession                                                                                                                             ����        �� ��             K.        UnlockSession                                                                                                                           ����        ՟ ߅             K.        close                                                                                                                                         `                                                                                     �Initialize                                                                           �Initialize With Options                                                             ACalibration                                                                          �Self Calibrate [CAL]                                                                ~Configuration                                                                       ~Acquisition                                                                          �Configure Acquisition                                                                �Configure Sample Mode [SM]                                                          �Downconversion                                                                       �Configure Downconversion [DC]                                                       [Arm                                                                                  �Configure Edge Arm Source [ARM]                                                      �Configure Glitch Arm Source [GA]                                                     �Configure Multi Arm [MA]                                                             �Configure Runt Arm Source [RA]                                                       �Configure TV Arm Source [TVA]                                                        �Configure Width Arm Source [WA]                                                      �Configure Window Arm Source [WINA]                                                   �Get Arm Source Name [ARM]                                                           �Channel                                                                              �Configure Channel                                                                    �Configure Input Filter [CF]                                                          �Get Channel Name                                                                    �Interleaved Data                                                                     �Configure Data Interleaved Channel List [DIC]                                        �Configure Time Interleaved Channel List [TIC]                                       zReference Oscillator                                                                 �Configure Reference Oscillator [RO]                                                  �Configure Reference Oscillator Output Enabled [RO]                                  �Sample Clock                                                                         �Configure Sample Clock [SC]                                                          �Configure Sample Clock Output Enabled [SC]                                          fTrigger                                                                              �Configure Active Trigger Source                                                      �Configure Edge Trigger Source                                                        �Configure Glitch Trigger Source [GT]                                                 �Configure Multi Trigger [MT]                                                         �Configure Pretrigger Samples [PS]                                                    �Configure Runt Trigger Source [RT]                                                   �Configure Trigger Holdoff [TH]                                                       �Configure Trigger Modifier [TM]                                                      �Configure TV Trigger Source [TVT]                                                    �Configure Width Trigger Source [WT]                                                  �Configure Window Trigger Source [WINT]                                               �Get Trigger Source Name                                                             �Set/Get/Check Attribute                                                             �Set Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViInt64                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViInt64                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             	Check Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViInt64                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           	�Waveform Acquisition                                                                 �Read Waveform Int16                                                                  �Read Waveform Int32                                                                  �Read Waveform Int8                                                                   �Read Waveform Real64                                                                5Low Level Acquisition                                                                �Abort                                                                                �Fetch Waveform Int16                                                                 �Fetch Waveform Int32                                                                 �Fetch Waveform Int8                                                                  �Fetch Waveform Real64                                                                �Initiate Acquisition                                                                 �Is Idle                                                                              �Is Measuring                                                                         �Is Waiting For Arm                                                                   �Is Waiting For Trigger                                                               �Query Min Waveform Memory                                                            �Send Software Arm [SA]                                                               �Send Software Trigger [ST]                                                           �Wait For Acquisition Complete                                                       �Multi-Record Acquisition                                                             �Fetch Multi-Record Waveform Int16 [MRA]                                              �Fetch Multi-Record Waveform Int32 [MRA]                                              �Fetch Multi-Record Waveform Int8 [MRA]                                               �Fetch Multi-Record Waveform Real64 [MRA]                                            Utility                                                                             qTemperature                                                                          �Configure Temperature Units [BT]                                                     �Query Board Temperature [BT]                                                         �Query Channel Temperature [CT]                                                       �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Specific Driver C Handle                                                         �Get Next Coercion Record                                                            �Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         2Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             �Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           