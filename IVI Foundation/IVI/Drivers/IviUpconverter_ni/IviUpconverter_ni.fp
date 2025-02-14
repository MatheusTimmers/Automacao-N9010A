s��   	     �    �]  DH   �   ����                                IviUpconverter                  IviUpconverter Class Driver (NI)                                                                      � � ��ViInt16  �  � ��ViInt32  � � ��ViReal64     � ��ViRsrc     	� 	��ViBoolean     	� 	��ViSession     � ��ViStatus     �  ViChar[]     � ��ViChar     � ��ViString     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � 	 
ViBoolean[]     � ��ViConstString     � ��ViAttr   �    This instrument driver contains programming support for the IviUpconverter class driver.  This driver has all the functions that IVI and VXIplug&play require.  

Note:  This driver requires the VISA and IVI libraries.       �    This class contains functions and sub-classes that configure the upconverter.  The class includes high-level functions that configure multiple instrument settings as well as low-level functions that set, get, and check individual attribute values.
     N    This class contains functions that configure the IF input of the instrument.     O    This class contains functions that configure the RF output of the instrument.     g    This class contains functions and sub-classes that configure the analog modulation of the instrument.     �    The IviUpconverterModulateAM extension group defines extensions for upconverters capable of applying amplitude modulation to the RF output signal.     �    The IviUpconverterModulateFM extension group defines extensions for upconverters capable of applying frequency modulation to the RF output signal.     �    The IviUpconverterModulatePM extension group defines extensions for upconverters capable of applying phase modulation to the RF output signal.     X    This class contains functions that get the analog modulation source of the instrument.     �    The IviUpconverterModulatePulse extension group defines extensions for upconverters capable of applying pulse modulation to the RF output signal.     �    The IviUpconverterSweep extension group defines extensions for upconverters capable of sweeping the output frequency, power, or gain.    �    The IviUpconverterFrequencySweep extension group defines extensions for upconverters capable of applying a frequency sweep to the RF output signal.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterSweepFrequencySweep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_SWEEP.    �    The IviUpconverterPowerSweep extension group defines extensions for upconverters capable of applying a power sweep to the RF output signal.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterPowerSweep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_SWEEP.    �    The IviUpconverterGainSweep extension group defines extensions for upconverters capable of applying a gain sweep to the RF output signal.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterGainSweep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_SWEEP.    �    The IviUpconverterFrequencyStep extension group defines extensions for upconverters capable of sweeping the frequency of the RF output signal in steps.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterFrequencyStep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_STEP.    �    The IviUpconverterPowerStep extension group defines extensions for upconverters capable of sweeping the power of the RF output signal in steps.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterPowerStep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_STEP.    �    The IviUpconverterGainStep extension group defines extensions for upconverters capable of sweeping the gain of the upconverter in steps.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterGainStep extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_STEP.    �    The IviUpconverterList extension group defines extensions for upconverters capable of sweeping the output frequency, power, or gain by a list of values.

In order to support this extension group, a driver shall first support IviUpconverterSweep Extension Group. The IviUpconverterList extension group is active when the IVIUPCONVERTER_ATTR_SWEEP_MODE is IVIUPCONVERTER_VAL_SWEEP_MODE_LIST.     �    The IviUpconverterALC extension group defines extensions for upconverters capable of configuring automatic level control (ALC).     y    The IviUpconverterReferenceOscillator extension group supports upconverters capable of configuring frequency reference.     �    The IviUpconverterModulateIQ extension group supports upconverters capable of applying IQ (vector) modulation to the RF output signal.     �    The IviUpconverterIQImpairment extension group supports upconverters capable of simulating or correcting impairment on IQ (vector) modulation.

This group is an extension of the IviUpconverterModulateIQ Extension Group.     T    This class contains sub-classes for the set, get, and check attribute functions.       �    This class contains functions that set an attribute to a new value.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     �    This class contains functions that obtain the current value of an attribute.  There are typesafe functions for each attribute data type.     m    This class contains functions and sub-classes that initiate instrument operations and report their status.
    _    This class contains functions and sub-classes that control common instrument operations.  These functions include many of functions that VXIplug&play require, such as reset, self-test, revision query, error query, and error message.  This class also contains functions that access IVI error infomation, lock the session, and perform instrument I/O.
     R    This class contains functions that retrieve and clear the IVI error information.     J    This class contains functions that retrieve interchangeability warnings.     ?    This class contains functions that retrieve coercion records.     k    This class contains functions that lock and unlock IVI instrument driver sessions for multithread safefy.    Q    This function performs the following initialization actions:

- Creates a new IVI instrument driver session.

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviUpconverter_LockSession and IviUpconverter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleUpconverter"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviUpconverter_LockSession and IviUpconverter_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    !� 9   �  �    Logical Name                      %m 9 �       ID Query                          'x 9� �       Reset Device                      (2 �� �  �    Instrument Handle                 *�#����  �    Status                             "SampleUpconverter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	          y    This function performs the following initialization actions:

- Creates a new IVI instrument driver and optionally sets the initial state of the following session attributes:

    IVIUPCONVERTER_ATTR_RANGE_CHECK         
    IVIUPCONVERTER_ATTR_QUERY_INSTRUMENT_STATUS  
    IVIUPCONVERTER_ATTR_CACHE               
    IVIUPCONVERTER_ATTR_SIMULATE            
    IVIUPCONVERTER_ATTR_RECORD_COERCIONS   

- Opens a session to the specified device using the interface and address you specify for the Resource Name parameter.

- If the ID Query parameter is set to VI_TRUE, this function queries the instrument ID and checks that it is valid for this instrument driver.

- If the Reset parameter is set to VI_TRUE, this function resets the instrument to a known state.

- Sends initialization commands to set the instrument to the state necessary for the operation of the instrument driver.

- Returns a ViSession handle that you use to identify the instrument in all subsequent instrument driver function calls.

Note:  This function creates a new session each time you invoke it. Although you can open more than one IVI session for the same resource, it is best not to do so.  You can use the same session in multiple program threads.  You can use the IviUpconverter_LockSession and IviUpconverter_UnlockSession functions to protect sections of code that require exclusive access to the resource.

Content from the IVI specifications reproduced with permission from the IVI Foundation. 
 
The IVI Foundation and its member companies make no warranty of any kind with regard to this material, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The IVI Foundation and its member companies shall not be liable for errors contained herein or for incidental or consequential damages in connection with the furnishing, performance, or use of this material.    �    Pass the logical name that identifies the particular driver session to use.  The driver session, in turn, identifies a specific driver and device and specifies the initial settings for the session.  You configure the logical name, driver session, specific driver, and device with the IVI Configuration utility. 

If you want to use your program with a different physical instrument, you change the configuration of the logical name to use the driver session for the new physical instrument. You can change the initial settings for the session by changing the configuration of the driver session.

Default Value:  "SampleUpconverter"

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

(2) Avoid creating multiple concurrent sessions to the same physical instrument.  Although you can create more than one IVI session for the same resource, it is best not to do so.  A better approach is to use the same IVI session in multiple execution threads.  You can use functions IviUpconverter_LockSession and IviUpconverter_UnlockSession to protect sections of code that require exclusive access to the resource.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �    You can use this control to set the initial value of certain attributes for the session.  The following table lists the attributes and the name you use in this parameter to identify the attribute.

Name              Attribute Defined Constant   
--------------------------------------------
RangeCheck        IVIUPCONVERTER_ATTR_RANGE_CHECK
QueryInstrStatus  IVIUPCONVERTER_ATTR_QUERY_INSTRUMENT_STATUS   
Cache             IVIUPCONVERTER_ATTR_CACHE   
Simulate          IVIUPCONVERTER_ATTR_SIMULATE  
RecordCoercions   IVIUPCONVERTER_ATTR_RECORD_COERCIONS

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
       "Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"
    :� 9   �  �    Logical Name                      >� 9 �       ID Query                          @� 9� �       Reset Device                      AL �� �  �    Instrument Handle                 D#����  �    Status                            J� �  � �    Option String                      "SampleUpconverter"   Yes VI_TRUE No VI_FALSE   Yes VI_TRUE No VI_FALSE    	           	           5"Simulate=0,RangeCheck=1,QueryInstrStatus=0,Cache=1"    [    This function configures whether the IF input signal completely bypasses the upconverter.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    �    Specifies whether the IF input signal bypasses the entire upconverter. The driver uses this value to set the IVIUPCONVERTER_ATTR_BYPASS attribute.

Valid Values: 

VI_TRUE - The IF input signal completely bypasses all stages of the upconverter.
VI_FALSE - The IF input signal does not bypass the upconverter and flows through the normal signal path as dictated by other device settings.

Default Value: VI_FALSE    S�-   �  �    Instrument Handle                 T{#����  �    Status                            T� 9 � �       Bypass                                 	           True VI_TRUE False VI_FALSE    ;    This function configures the active IF input attenuation.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values     �    Specifies the amount of attenuation or gain to apply to the active IF input of the upconverter. The driver uses this value to set the IVIUPCONVERTER_ATTR_IF_INPUT_ATTENUATION attribute. 

Units: dB

Default Value: 0.0 dB    WH-   �  �    Instrument Handle                 X#����  �    Status                            X$ 9 � �  �    IF Input Attenuation (dB)              	           0.0   �    This function returns the specific driver defined IF input name that corresponds to the one-based index that you specify. If the driver defines a qualified IF input name, this function returns the qualified name. If the specified value for the index parameter is less than one or greater than the value of the IVIUPCONVERTER_ATTR_IF_INPUT_COUNT attribute, the function returns an empty string in the name parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     Q    Specifies the one-based index of the IF input name to return.

Default Value: 1     E    Specifies the buffer size for the name parameter.

Default Value: 0     �    Returns the IF input name that corresponds to the index.  

The name buffer must contain at least as many elements as the value you specify with the nameBufferSize parameter.
    [�-   �  �    Instrument Handle                 \R#����  �    Status or Required Size           c 9  �  �    Index                             cs 9 � �  �    Name Buffer Size                  c� 9� �  �    Name                                   	           1    0    	            Z    This function selects one of the available IF inputs and sets it as the active IF input.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values     �    Specifies the active IF intput name. The driver uses this value to set the IVIUPCONVERTER_ATTR_ACTIVE_IF_INPUT attribute.

Default Value: ""    f
-   �  �    Instrument Handle                 f�#����  �    Status                            f� 9 � �  �    IF Input Name                          	           ""    B    This function configures whether to enable the active RF output.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    b    Enables or disables the active RF output. You can enable only a single RF output at a time. When you enable particular RF output, all other RF outputs are disabled. The driver uses this value to set the IVIUPCONVERTER_ATTR_RF_OUTPUT_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables RF output.
VI_FALSE - Disables RF output.

Default Value: VI_TRUE    h{-   �  �    Instrument Handle                 iA#����  �    Status                            iX 9 � �       RF Output Enabled                      	          True VI_TRUE False VI_FALSE    :    This function configures the active RF output frequency.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the frequency of the active RF output. The driver uses this value to set the IVIUPCONVERTER_ATTR_RF_OUTPUT_FREQUENCY attribute. 

Units: Hertz

Default Value: 100.0 MHz    k�-   �  �    Instrument Handle                 l�#����  �    Status                            l� 9 � �  �    RF Output Frequency (Hz)               	           100.0e6    q    This function configures the amount of gain or attenuation to apply to the active RF output of the upconverter.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values     �    Specifies the amount of gain or attenuation to apply to the active RF output of the upconverter. The driver uses this value to set the IVIUPCONVERTER_ATTR_RF_OUTPUT_GAIN attribute.

Units: dB

Default Value: 0.0 dB    n�-   �  �    Instrument Handle                 oc#����  �    Status                            oz 9 � �  �    RF Output Gain (dB)                    	           0.0    i    This function configures the power level that should appear at the active RF output of the upconverter.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values     �    Specifies the output power that should appear at the active RF output of the upconverter. The driver uses this value to set the IVIUPCONVERTER_ATTR_RF_OUTPUT_LEVEL attribute.

Units: dBm

Default Value: 0.0 dBm    q�-   �  �    Instrument Handle                 rF#����  �    Status                            r] 9 � �  �    RF Output Level (dBm)                  	           0.0    �    This function configures the output trigger used to indicate when the active RF output has settled to a point suitable for processing by downstream components.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    �    Specifies where to fire a trigger when the active RF output has settled to a point that is suitable for processing by downstream components. The driver uses this value to set the IVIUPCONVERTER_ATTR_RF_OUTPUT_READY_TRIGGER attribute.

Valid Values:
IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE - No trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_EXTERNAL - External trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_INTERNAL - Internal trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_SOFTWARE - Software trigger.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN0 - LAN0 (LXI defined "LAN0" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN1 - LAN1 (LXI defined "LAN1" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN2 - LAN2 (LXI defined "LAN2" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN3 - LAN3 (LXI defined "LAN3" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN4 - LAN4 (LXI defined "LAN4" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN5 - LAN5 (LXI defined "LAN5" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN6 - LAN6 (LXI defined "LAN6" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN7 - LAN7 (LXI defined "LAN7" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI0 - LXI Trigger Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI1 - LXI Trigger Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI2 - LXI Trigger Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI3 - LXI Trigger Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI4 - LXI Trigger Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI5 - LXI Trigger Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI6 - LXI Trigger Bus Line 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI7 - LXI Trigger Bus Line 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL0 - TTL Interface 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL1 - TTL Interface 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL2 - TTL Interface 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL3 - TTL Interface 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL4 - TTL Interface 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL5 - TTL Interface 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL6 - TTL Interface 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL7 - TTL Interface 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_STAR - PXI Star Interface.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARA - PXI Express DStar Line A.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARB - PXI Express DStar Line B.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARC - PXI Express DStar Line C.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI0 - RTSI Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI1 - RTSI Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI2 - RTSI Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI3 - RTSI Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI4 - RTSI Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI5 - RTSI Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI6 - RTSI Bus Line 6.

Default Value:
IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE    t�-   �  �    Instrument Handle                 u^#����  �    Status                            uu 9 � � �    RF Output Ready Trigger                	                   0  �None IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE Immediate IVIUPCONVERTER_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIUPCONVERTER_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIUPCONVERTER_VAL_TRIGGER_SOURCE_INTERNAL Software IVIUPCONVERTER_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI0 RTSI1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI6    ?    This function configures the attenuator hold enabled setting.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Enables or disables the attenuator hold on the active RF output. The driver uses this value to set the IVIUPCONVERTER_ATTR_ATTENUATOR_HOLD_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables attenuator hold.
VI_FALSE - Disables attenuator hold.

Default Value: VI_FALSE    �b-   �  �    Instrument Handle                 �(#����  �    Status                            �? 9 � �       Attenuator Hold Enabled                	           True VI_TRUE False VI_FALSE   �    This function returns the specific driver defined RF output name that corresponds to the one-based index that you specify. If the driver defines a qualified RF output name, this function returns the qualified name. If the value that you pass for the index parameter is less than one or greater than the value of the IVIUPCONVERTER_ATTR_RF_OUTPUT_COUNT attribute, the function returns an empty string in the name parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     R    Specifies the one-based index of the RF output name to return.

Default Value: 1     E    Specifies the buffer size for the name parameter.

Default Value: 0     �    Returns the RF output name that corresponds to the index.  

The name buffer must contain at least as many elements as the value you specify with the nameBufferSize parameter.    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Index                             �1 9 � �  �    Name Buffer Size                  �~ 9� �  �    Name                                   	           1    0    	            \    This function selects one of the available RF outputs and sets it as the active RF output.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the active RF output name. The driver uses this value to set the IVIUPCONVERTER_ATTR_ACTIVE_RF_OUTPUT attribute.

Default Value: ""    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � �  �    RF Output Name                         	           ""    a    This function configures the upconverter to apply amplitude modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies whether the upconverter enables or disables amplitude modulation of the RF output signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_AM_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables AM.
VI_FALSE - Disables AM.

Default Value: VI_FALSE    �\-   �  �    Instrument Handle                 �"#����  �    Status                            �9 9 � �       AM Enabled                             	           True VI_TRUE False VI_FALSE    �    This function configures the coupling of the external source the upconverter uses for amplitude modulation of the output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_AM_EXTERNAL_COUPLING attribute.

Valid Values:
IVIUPCONVERTER_VAL_AM_EXTERNAL_COUPLING_AC - The external source is coupled for AC only.

IVIUPCONVERTER_VAL_AM_EXTERNAL_COUPLING_DC - The external source is coupled for both DC and AC.

Default Value:
IVIUPCONVERTER_VAL_AM_EXTERNAL_COUPLING_AC    ��-   �  �    Instrument Handle                 �k#����  �    Status                            �� 9 � � �    AM External Coupling                   	                      \AC IVIUPCONVERTER_VAL_AM_EXTERNAL_COUPLING_AC DC IVIUPCONVERTER_VAL_AM_EXTERNAL_COUPLING_DC    p    This function configures the modulation source, scaling, and depth for the upconverter's amplitude modulation.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    #    Specifies the source of the signal used as the modulating signal. If you specifiy more than one source, the driver sums the voltages of all sources. Separate multiple source names by commas. The driver uses this value to set the IVIUPCONVERTER_ATTR_AM_SOURCE attribute. 

Default Value: ""    �    Specifies either linear or logarithmic characteristics for amplitude modulation. The unit of the IVIUPCONVERTER_ATTR_AM_DEPTH attribute is changed with this setting. The driver uses this value to set the IVIUPCONVERTER_ATTR_AM_SCALING attribute.

Valid Values:
IVIUPCONVERTER_VAL_AM_SCALING_LINEAR - Enables linear attenuation for amplitude modulation.

IVIUPCONVERTER_VAL_AM_SCALING_LOGARITHMIC - Enables logarithmic attenuation for amplitude modulation.

Default Value:
IVIUPCONVERTER_VAL_AM_SCALING_LINEAR    �    Specifies the extent of modulation the upconverter applies to the RF output signal with the modulating signal as a result of summing all sources, internal and external. The driver uses this value to set the IVIUPCONVERTER_ATTR_AM_DEPTH attribute. 

Default Value: 0.0

Note:

(1) If the IVIUPCONVERTER_ATTR_AM_SCALING is IVIUPCONVERTER_VAL_AM_SCALING_LINEAR, then the units are percent (%). If the IVIUPCONVERTER_ATTR_AM_SCALING is IVIUPCONVERTER_VAL_AM_SCALING_LOGARITHMIC, then the units are dBm.    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Source                            �� 9 � � �    Scaling                           �� 9� �  �    Depth                                  	           ""               bLinear IVIUPCONVERTER_VAL_AM_SCALING_LINEAR Logarithmic IVIUPCONVERTER_VAL_AM_SCALING_LOGARITHMIC    0.0    a    This function configures the upconverter to apply frequency modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies whether the upconverter enables or disables frequency modulation of the RF output signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_FM_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables FM.
VI_FALSE - Disables FM.

Default Value: VI_FALSE    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � �       FM Enabled                             	           True VI_TRUE False VI_FALSE    �    This function configures the coupling of the external source the upconverter uses for frequency modulation of the output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_FM_EXTERNAL_COUPLING attribute.

Valid Values:
IVIUPCONVERTER_VAL_FM_EXTERNAL_COUPLING_AC - The external source is coupled for AC only.

IVIUPCONVERTER_VAL_FM_EXTERNAL_COUPLING_DC - The external source is coupled for both DC and AC.

Default Value:
IVIUPCONVERTER_VAL_FM_EXTERNAL_COUPLING_AC    �-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � � �    FM External Coupling                   	                      \AC IVIUPCONVERTER_VAL_FM_EXTERNAL_COUPLING_AC DC IVIUPCONVERTER_VAL_FM_EXTERNAL_COUPLING_DC    j    This function configures the modulation source and deviation for the upconverter's frequency modulation.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    "    Specifies the source of the signal used as the modulating signal. If you specify more than one source, the driver sums the voltages of all sources. Separate multiple source names by commas. The driver uses this value to set the IVIUPCONVERTER_ATTR_FM_SOURCE attribute. 

Default Value: ""    "    Specifies the extent of modulation the upconverter applies to the RF output signal with the modulating signal as a result of summing all sources, internal and external. The driver uses this value to set the IVIUPCONVERTER_ATTR_FM_DEVIATION attribute. 

Units: Hertz

Default Value: 0.0 Hz    �--   �  �    Instrument Handle                 ��#����  �    Status                            �	 9  �  �    Source                            �3 9 � �  �    Deviation (Hz)                         	           ""    0.0    ]    This function configures the upconverter to apply phase modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    	    Specifies whether the upconverter enables or disables phase modulation of the RF output signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_PM_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables PM.
VI_FALSE - Disables PM.

Default Value: VI_FALSE    ��-   �  �    Instrument Handle                 �y#����  �    Status                            �� 9 � �       PM Enabled                             	           True VI_TRUE False VI_FALSE    i    This function configures the coupling of the external source for phase modulation of the output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Specifies the coupling of the external source of the modulating signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_PM_EXTERNAL_COUPLING attribute.

Valid Values:
IVIUPCONVERTER_VAL_PM_EXTERNAL_COUPLING_AC - The external source is coupled for AC only.

IVIUPCONVERTER_VAL_PM_EXTERNAL_COUPLING_DC - The external source is coupled for both DC and AC.

Default Value:
IVIUPCONVERTER_VAL_PM_EXTERNAL_COUPLING_AC    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � � �    PM External Coupling                   	                      \AC IVIUPCONVERTER_VAL_PM_EXTERNAL_COUPLING_AC DC IVIUPCONVERTER_VAL_PM_EXTERNAL_COUPLING_DC    f    This function configures the modulation source and deviation for the upconverter's phase modulation.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    "    Specifies the source of the signal used as the modulating signal. If you specify more than one source, the driver sums the voltages of all sources. Separate multiple source names by commas. The driver uses this value to set the IVIUPCONVERTER_ATTR_PM_SOURCE attribute. 

Default Value: ""    (    Specifies the extent of modulation the upconverter applies to the RF output signal with the modulating signal as a result of summing all sources, internal and external. The driver uses this value to set the IVIUPCONVERTER_ATTR_PM_DEVIATION attribute. 

Units: Radians

Default Value: 0.0 Radian    ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Source                            �� 9 � �  �    Deviation (rad)                        	           ""    0.0   �    This function returns the specific driver defined analog modulation source name that corresponds to the one-based index that you specify. If the driver defines a qualified analog modulation source name, this function returns the qualified name. If the value that you pass for the index parameter is less than one or greater than the value of the IVIUPCONVERTER_ATTR_ANALOG_MODULATION_SOURCE_COUNT attribute, the function returns an empty string in the name parameter and returns the Invalid Value error.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     a    Specifies the one-based index of the analog modulation source name to return.

Default Value: 1     E    Specifies the buffer size for the name parameter.

Default Value: 0     �    Returns the analog modulation source name that corresponds to the index.  

The name buffer must contain at least as many elements as the value you specify with the nameBufferSize parameter.    �-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Index                             �a 9 � �  �    Name Buffer Size                  ® 9� �  �    Name                                   	           1    0    	            ]    This function configures the upconverter to apply pulse modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Enables or disables pulse modulation of the RF output signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_PULSE_MODULATION_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables pulse modulation.
VI_FALSE - Disables pulse modulation.

Default Value: VI_FALSE    �
-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � �       Pulse Modulation Enabled               	           True VI_TRUE False VI_FALSE    F    This function configures the polarity of the external source signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Specifies the polarity of the external source signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_PULSE_MODULATION_EXTERNAL_POLARITY attribute.

Valid Values:
IVIUPCONVERTER_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL - The upconverter modulates the carrier signal with normal pulse polarity. Increasing the positive pulse voltage level results in a higher RF level.

IVIUPCONVERTER_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_INVERSE - The upconverter modulates the carrier signal with inverted pulse polarity. Increasing the positive pulse voltage level results in a lower RF level.

Default Value:
IVIUPCONVERTER_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL    �-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9 � � �    External Polarity                      	                      �Normal IVIUPCONVERTER_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_NORMAL Inverse IVIUPCONVERTER_VAL_PULSE_MODULATION_EXTERNAL_POLARITY_INVERSE    �    This function configures whether the RF output signal is a continuous wave or the frequency, power level, or gain is swept or stepped.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Pass whether the RF output signal is a continuous wave or the frequency, power level, or gain is swept or stepped. The driver uses this value to set the IVIUPCONVERTER_ATTR_SWEEP_MODE attribute.

Valid Values:
IVIUPCONVERTER_VAL_SWEEP_MODE_NONE - The RF output is a non-swept signal (continuous wave). Frequency and power level settings from the base capability group are used.

IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_SWEEP - Sweeps the RF output signal frequency in an analog form (non-stepped). Refer to the IviUpconverterFrequencySweep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_SWEEP - Sweeps the RF output signal power in an analog form (non-stepped). Refer to the IviUpconverterPowerSweep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_SWEEP - Sweeps the upconverter's gain in an analog form (non-stepped). Refer to the  IviUpconverterGainSweep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_STEP - Sweeps the RF output signal frequency in steps. Refer to the IviUpconverterFrequencyStep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_STEP - Sweeps the RF output signal power level in steps. Refer to the IviUpconverterPowerStep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_STEP - Sweeps the upconverter's gain in steps. Refer to the IviUpconverterGainStep extension group.

IVIUPCONVERTER_VAL_SWEEP_MODE_LIST - Uses two lists with frequency and power level or gain values to sweep the RF output signal. Refer to the IviUpconverterList extension group.

Default value:
IVIUPCONVERTER_VAL_SWEEP_MODE_NONE    �    Specifies the way to start the sweep or run the sweep continuously. The driver uses this value to set the IVIUPCONVERTER_ATTR_SWEEP_TRIGGER_SOURCE attribute.

Valid Values:
IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE - No trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_IMMEDIATE - Trigger immediately.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_EXTERNAL - External trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_INTERNAL - Internal trigger source.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_SOFTWARE - Software trigger.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN0 - LAN0 (LXI defined "LAN0" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN1 - LAN1 (LXI defined "LAN1" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN2 - LAN2 (LXI defined "LAN2" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN3 - LAN3 (LXI defined "LAN3" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN4 - LAN4 (LXI defined "LAN4" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN5 - LAN5 (LXI defined "LAN5" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN6 - LAN6 (LXI defined "LAN6" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN7 - LAN7 (LXI defined "LAN7" LAN message).

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI0 - LXI Trigger Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI1 - LXI Trigger Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI2 - LXI Trigger Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI3 - LXI Trigger Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI4 - LXI Trigger Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI5 - LXI Trigger Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI6 - LXI Trigger Bus Line 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI7 - LXI Trigger Bus Line 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL0 - TTL Interface 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL1 - TTL Interface 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL2 - TTL Interface 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL3 - TTL Interface 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL4 - TTL Interface 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL5 - TTL Interface 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL6 - TTL Interface 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL7 - TTL Interface 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_STAR - PXI Star Interface.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG0 - PXI Trigger Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG1 - PXI Trigger Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG2 - PXI Trigger Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG3 - PXI Trigger Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG4 - PXI Trigger Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG5 - PXI Trigger Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG6 - PXI Trigger Bus Line 6.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG7 - PXI Trigger Bus Line 7.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARA - PXI Express DStar Line A.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARB - PXI Express DStar Line B.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARC - PXI Express DStar Line C.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI0 - RTSI Bus Line 0.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI1 - RTSI Bus Line 1.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI2 - RTSI Bus Line 2.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI3 - RTSI Bus Line 3.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI4 - RTSI Bus Line 4.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI5 - RTSI Bus Line 5.

IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI6 - RTSI Bus Line 6.

Default Value:
IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE    �z-   �  �    Instrument Handle                 �@#����  �    Status                            �W 9  � �    Sweep Mode                        �r 9 � � �    Sweep Trigger Source                   	                     �None IVIUPCONVERTER_VAL_SWEEP_MODE_NONE Frequency Sweep IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_SWEEP Power Sweep IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_SWEEP Gain Sweep IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_SWEEP Frequency Step IVIUPCONVERTER_VAL_SWEEP_MODE_FREQUENCY_STEP Power Step IVIUPCONVERTER_VAL_SWEEP_MODE_POWER_STEP Gain Step IVIUPCONVERTER_VAL_SWEEP_MODE_GAIN_STEP List IVIUPCONVERTER_VAL_SWEEP_MODE_LIST            0  �None IVIUPCONVERTER_VAL_TRIGGER_SOURCE_NONE Immediate IVIUPCONVERTER_VAL_TRIGGER_SOURCE_IMMEDIATE External IVIUPCONVERTER_VAL_TRIGGER_SOURCE_EXTERNAL Internal IVIUPCONVERTER_VAL_TRIGGER_SOURCE_INTERNAL Software IVIUPCONVERTER_VAL_TRIGGER_SOURCE_SOFTWARE LAN0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN0 LAN1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN1 LAN2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN2 LAN3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN3 LAN4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN4 LAN5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN5 LAN6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN6 LAN7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LAN7 LXI0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI0 LXI1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI1 LXI2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI2 LXI3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI3 LXI4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI4 LXI5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI5 LXI6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI6 LXI7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_LXI7 TTL0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL0 TTL1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL1 TTL2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL2 TTL3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL3 TTL4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL4 TTL5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL5 TTL6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL6 TTL7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_TTL7 PXI_STAR IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_STAR PXI_TRIG0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG0 PXI_TRIG1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG1 PXI_TRIG2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG2 PXI_TRIG3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG3 PXI_TRIG4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG4 PXI_TRIG5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG5 PXI_TRIG6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG6 PXI_TRIG7 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXI_TRIG7 PXIe_DSTARA IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARA PXIe_DSTARB IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARB PXIe_DSTARC IVIUPCONVERTER_VAL_TRIGGER_SOURCE_PXIE_DSTARC RTSI0 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI0 RTSI1 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI1 RTSI2 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI2 RTSI3 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI3 RTSI4 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI4 RTSI5 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI5 RTSI6 IVIUPCONVERTER_VAL_TRIGGER_SOURCE_RTSI6    F    This function configures the start and stop frequency for the sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies the start frequency of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_SWEEP_START attribute.

Units: Hertz

Default Value: 100.0 kHz

Note: If the stop frequency is less than the start frequency, the frequency decreases during the sweep.        Specifies the stop frequency of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_SWEEP_STOP attribute.

Units: Hertz

Default Value: 100.0 MHz

Note: If the stop frequency is less than the start frequency, the frequency decreases during the sweep.     ��-   �  �    Instrument Handle                 �#����  �    Status                            �� 9  �  �    Frequency Sweep Start (Hz)        �� 9 � �  �    Frequency Sweep Stop (Hz)              	           100.0e3    100.0e6    U    This function configures the center frequency and the frequency span for the sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     _    Specifies the center frequency for a frequency sweep. 

Units: Hertz

Default Value: 50.0 MHz     ]    Specifies the frequency span for a frequency sweep.

Units: Hertz

Default Value: 500.0 KHz    �m-   �  �    Instrument Handle                 �3#����  �    Status                            �J 9  �  �    Center (Hz)                       � 9 � �  �    Span (Hz)                              	           50.0e6    500.0e3    ?    This function configures the duration of one frequency sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the duration of one sweep from start to stop frequency. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_SWEEP_TIME attribute.

Units: Seconds

Default Value: 1.0 s    �V-   �  �    Instrument Handle                 �#����  �    Status                            �3 9 � �  �    Frequency Sweep Time (s)               	           1.0    B    This function configures the start and stop power for the sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies the start power of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_SWEEP_START attribute.

Units: dBm

Default Value: -50.0 dBm

Note: If the stop power is less than the start power, the power decreases during the sweep.        Specifies the stop power of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_SWEEP_STOP attribute.

Units: dBm

Default Value: -10.0 dBm

Note: If the stop power is less than the start power, the power decreases during the sweep.     ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Power Sweep Start (dBm)           �� 9 � �  �    Power Sweep Stop (dBm)                 	           -50.0    -10.0    ;    This function configures the duration of one power sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the duration of one sweep from start to stop power. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_SWEEP_TIME attribute.

Units: Seconds

Default Value: 1.0 s    �)-   �  �    Instrument Handle                 ��#����  �    Status                            � 9 � �  �    Power Sweep Time (s)                   	           1.0    A    This function configures the start and stop gain for the sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the start gain of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_SWEEP_START attribute.

Units: dB

Default Value: -10.0 dB

Note: If the stop gain is less than the start gain, the gain decreases during the sweep.     �    Specifies the stop gain of the sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_SWEEP_STOP attribute.

Units: dB

Default Value: 0.0 dB

Note: If the stop gain is less than the start gain, the gain decreases during the sweep.     ��-   �  �    Instrument Handle                 ��#����  �    Status                            �� 9  �  �    Gain Sweep Start (dB)             � 9 � �  �    Gain Sweep Stop (dB)                   	           -10.0    0.0    :    This function configures the duration of one gain sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Specifies the duration of one sweep from start to stop gain. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_SWEEP_TIME attribute.

Units: Seconds

Default Value: 1.0 s   �-   �  �    Instrument Handle                �#����  �    Status                           � 9 � �  �    Gain Sweep Time (s)                    	           1.0    r    This function configures the attributes that control the step frequencies of the upconverter's RT output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    r    Specifies the scaling of the steps. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SCALING attribute.

Valid Values:
IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LINEAR - Enables linear scaling.

IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC - Enables logarithmic scaling.

Default value:
IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LINEAR         Return Values         Specifies the start frequency of the stepped sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_START attribute.

Units: Hertz

Default Value: 500.0 kHz

Note: If the stop frequency is less than the start frequency, the frequency decreases during the sweep.        Specifies the stop frequency of the stepped sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_STOP attribute.

Units: Hertz

Default Value: 5.0 MHz

Note: If the stop frequency is less than the start frequency, the frequency decreases during the sweep.    �    Specifies the step size. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SIZE attribute.

Default Value: 100.0e3

Note: The units are hertz if the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SCALING attribute is IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LINEAR and unitless (factor) if the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SCALING is IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC.   �-   �  �    Instrument Handle                t 9� � �    Frequency Step Scaling           �#����  �    Status                            9  �  �    Frequency Step Start (Hz)        	- 9 � �  �    Frequency Step Stop (Hz)         
Q �  �  �    Frequency Step Size                               zLinear IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LINEAR Logarithmic IVIUPCONVERTER_VAL_FREQUENCY_STEP_SCALING_LOGARITHMIC    	           500.0e3    5.0e6    100.0e3    D    This function configures the attributes that control the stepping.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Enables or disables single step mode. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SINGLE_STEP_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables single step mode.
VI_FALSE - Disables single step mode.

Default Value: VI_FALSE    i    Specifies the duration of one step. The driver uses this value to set the IVIUPCONVERTER_ATTR_FREQUENCY_STEP_DWELL attribute.

Units: Seconds

Default Value: 1.0 s

Note: The dwell time starts immediately after a trigger or next step; no settling time is added. This value is valid only when IVIUPCONVERTER_ATTR_FREQUENCY_STEP_SINGLE_STEP_ENABLED is VI_FALSE.   3-   �  �    Instrument Handle                �#����  �    Status                            9 P �       Single Step Enabled               9 � �  �    Frequency Step Dwell (s)               	           True VI_TRUE False VI_FALSE    1.0    T    This function resets the current frequency step to the frequency step start value.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values   �-   �  �    Instrument Handle                �#����  �    Status                                 	           m    This function configures the attributes that control the power steps of the upconverter's RT output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies the start power of the stepping. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_STEP_START attribute.

Units: dBm

Default Value: -50.0 dBm

Note: If the stop power is less than the start power, the power decreases during the sweep.        Specifies the stop power of the stepping. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_STEP_STOP attribute.

Units: dBm

Default Value: -10.0 dBm

Note: If the stop power is less than the start power, the power decreases during the sweep.     �    Specifies the step size. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_STEP_SIZE attribute.

Units: dBm

Default Value: 0.1 dBm   �-   �  �    Instrument Handle                �#����  �    Status                           � 9  �  �    Power Step Start (dBm)           � 9 � �  �    Power Step Stop (dBm)            � 9� �  �    Power Step Size (dBm)                  	           -50.0    -10.0    0.1    4    This function configures the power stepping dwell.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Enables or disables single step mode. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_STEP_SINGLE_STEP_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables single step mode.
VI_FALSE - Disables single step mode.

Default Value: VI_FALSE        Specifies the duration of one step. The driver uses this value to set the IVIUPCONVERTER_ATTR_POWER_STEP_DWELL attribute.

Units: Seconds

Default Value: 1.0 s

Note: This value is valid only when IVIUPCONVERTER_ATTR_POWER_STEP_SINGLE_STEP_ENABLED is VI_FALSE.   �-   �  �    Instrument Handle                �#����  �    Status                           � 9 P �       Single Step Enabled              � 9 � �  �    Power Step Dwell (s)                   	           True VI_TRUE False VI_FALSE    1.0    B    This function resets the stepping if you enable single stepping.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values   -   �  �    Instrument Handle                �#����  �    Status                                 	           _    This function configures the attributes that control the gain steps of the upconverter sweep.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values        Specifies the start gain of the stepped sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_STEP_START attribute.

Units: dB

Default Value: -10.0 dB

Note: If the stop gain is less than the start gain, the gain decreases during the sweep.     �    Specifies the stop gain of the stepped sweep. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_STEP_STOP attribute.

Units: dB

Default Value: 0.0 dB

Note: If the stop gain is less than the start gain, the gain decreases during the sweep.     �    Specifies the step size. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_STEP_SIZE attribute.

Units: dB

Default Value: 0.1 dB   �-   �  �    Instrument Handle                 �#����  �    Status                            � 9  �  �    Gain Step Start (dB)             !� 9 � �  �    Gain Step Stop (dB)              "� 9� �  �    Gain Step Size (dB)                    	           -10.0    0.0    0.1    3    This function configures the gain stepping dwell.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Enables or disables single step mode. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_STEP_SINGLE_STEP_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables single step mode.
VI_FALSE - Disables single step mode.

Default Value: VI_FALSE        Specifies the duration of one step. The driver uses this value to set the IVIUPCONVERTER_ATTR_GAIN_STEP_DWELL attribute.

Units: Seconds

Default Value: 1.0 s

Note: This value is valid only when IVIUPCONVERTER_ATTR_GAIN_STEP_SINGLE_STEP_ENABLED is VI_FALSE.   $�-   �  �    Instrument Handle                %v#����  �    Status                           %� 9 P �       Single Step Enabled              &� 9 � �  �    Gain Step Dwell (s)                    	           True VI_TRUE False VI_FALSE    1.0    B    This function resets the stepping if you enable single stepping.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values   (�-   �  �    Instrument Handle                )�#����  �    Status                                 	           9    This function creates a named list of frequency values.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     O    Specifies the number of frequencies in the frequency list.

Default Value: 0
     �    Specifies the array of frequency values to become elements of the list. The array must have at least as many elements as the value in the frequencyBufferSize parameter.

Units: Hertz
     H    Specifies the name of the frequency list to create.

Default Value: ""   *�-   �  �    Instrument Handle                +P#����  �    Status                           +g 9 � �  �    Frequency Buffer Size            +� 9� � �    Frequency                        , 9  �  �    Name                                   	           0        ""    5    This function creates a named list of power values.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     F    Specifies the number of powers in the power list.

Default Value: 0
     �    Specifies the array of power values to become elements of the list. The array must have at least as many elements as the value in the powerBufferSize parameter.

Units: dBm
     D    Specifies the name of the power list to create.

Default Value: ""   .4-   �  �    Instrument Handle                .�#����  �    Status                           / 9 � �  �    Power Buffer Size                /_ 9� � �    Power                            0 9  �  �    Name                                   	           0        ""    4    This function creates a named list of gain values.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     D    Specifies the number of gains in the gain list.

Default Value: 0
     �    Specifies the array of gain values to become elements of the list. The array must have at least as many elements as the value in the gainBufferSize parameter.

Units: dB
     C    Specifies the name of the gain list to create.

Default Value: ""   1�-   �  �    Instrument Handle                2�#����  �    Status                           2� 9 � �  �    Gain Buffer Size                 2� 9� � �    Gain                             3� 9  �  �    Name                                   	           0        ""    H    This function creates a named list of frequency and power value pairs.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     M    Specifies the number of frequency and power value pairs.

Default Value: 0
     �    Specifies the array of frequency values to become elements of the list. The array must have at least as many elements as the value in the bufferSize parameter.

Units: Hertz
     >    Specifies the name of the list to create.

Default Value: ""     �    Specifies the array of power values to become elements of the list. The array must have at least as many elements as the value in the bufferSize parameter.

Units: dBm
   5f-   �  �    Instrument Handle                6,#����  �    Status                           6C 9 � �  �    Buffer Size                      6� 9� � �    Frequency                        7P 9  �  �    Name                             7� �  � �    Power                                  	           0        ""        G    This function creates a named list of frequency and gain value pairs.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     L    Specifies the number of frequency and gain value pairs.

Default Value: 0
     �    Specifies the array of frequency values to become elements of the list. The array must have at least as many elements as the value in the bufferSize parameter.

Units: Hertz
     >    Specifies the name of the list to create.

Default Value: ""     �    Specifies the array of gain values to become elements of the list. The array must have at least as many elements as the value in the bufferSize parameter.

Units: dB
   9�-   �  �    Instrument Handle                :�#����  �    Status                           :� 9 � �  �    Buffer Size                      ;) 9� � �    Frequency                        ;� 9  �  �    Name                             <' �  � �    Gain                                   	           0        ""        9    This function deletes all lists from the pool of lists.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values   >y-   �  �    Instrument Handle                ??#����  �    Status                                 	           -    This function configures the list stepping.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values     �    Enables or disables single step mode. The driver uses this value to set the IVIUPCONVERTER_ATTR_LIST_SINGLE_STEP_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables single step mode.
VI_FALSE - Disables single step mode.

Default Value: VI_FALSE     �    Specifies the duration of one step. The driver uses this value to set the IVIUPCONVERTER_ATTR_LIST_DWELL attribute.

Units: Seconds

Default Value: 1.0 s

Note: This value is valid only when IVIUPCONVERTER_ATTR_LIST_SINGLE_STEP_ENABLED is VI_FALSE.   @-   �  �    Instrument Handle                @�#����  �    Status                           @� 9 P �       Single Step Enabled              A� 9 � �  �    List Dwell (s)                         	           True VI_TRUE False VI_FALSE    1.0    A    This function resets the current list to the first entry value.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values   D8-   �  �    Instrument Handle                D�#����  �    Status                                 	           ]    This function configures the  Automatic Level Control (ALC) of the upconverter's RF output.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Specifies the source of the controlling voltage for the ALC. The RF level at the sensor point is held constant. The driver uses this value to set the IVIUPCONVERTER_ATTR_ALC_SOURCE attribute.

Valid Values:
IVIUPCONVERTER_VAL_ALC_SOURCE_INTERNAL - The ALC is controlled by an internal measurement source.

IVIUPCONVERTER_VAL_ALC_SOURCE_EXTERNAL - The ALC is controlled by an external voltage.

Default Value:
IVIUPCONVERTER_VAL_ALC_SOURCE_INTERNAL        Specifies the bandwidth of the level control. Narrow bandwidth improves noise and allows AM with modulation frequencies beyond bandwidth frequency. The driver uses this value to set the IVIUPCONVERTER_ATTR_ALC_BANDWIDTH attribute.

Units: Hertz

Default Value: 0.0 Hz   E�-   �  �    Instrument Handle                F�#����  �    Status                           F� 9  � �    Source                           H� 9 � �  �    ALC Bandwidth (Hz)                     	                      `Internal IVIUPCONVERTER_VAL_ALC_SOURCE_INTERNAL External IVIUPCONVERTER_VAL_ALC_SOURCE_EXTERNAL    0.0    B    This function configures the upconverter's reference oscillator.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    �    Specifies the frequency of the external signal used as the reference for internal RF frequency generation. The driver uses this value to set the IVIUPCONVERTER_ATTR_REFERENCE_OSCILLATOR_EXTERNAL_FREQUENCY attribute. 

Units: Hertz

Default Value: 10.0 MHz

Note: This value is valid only when IVIUPCONVERTER_ATTR_REFERENCE_OSCILLATOR_SOURCE is IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL.    �    Specifies the reference oscillator source used to generate the precise RF output frequency. The driver uses this value to set the IVIUPCONVERTER_ATTR_REFERENCE_OSCILLATOR_SOURCE attribute.

Valid Values:
IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL - Use the internal reference oscillator.

IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL - Use an external reference oscillator.

Default Value:
IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL   KR-   �  �    Instrument Handle                L#����  �    Status                           L/ 9 � �  �    External Frequency (Hz)          M� 9  � �    Reference Oscillator Source            	           10.0e6               �Internal IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_INTERNAL External IVIUPCONVERTER_VAL_REFERENCE_OSCILLATOR_SOURCE_EXTERNAL    �    This function configures the upconverter's reference oscillator output. Many upconverters support the ability to output their frequency reference. Use this function to enable or disable that output.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    $    Enables or disables the reference output. The driver uses this value to set the IVIUPCONVERTER_ATTR_REFERENCE_OSCILLATOR_OUTPUT_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables the frequency reference output.
VI_FALSE - Disables the frequency reference output.

Default Value: VI_FALSE   Q�-   �  �    Instrument Handle                R�#����  �    Status                           R� 9 � �       Output Enabled                         	           True VI_TRUE False VI_FALSE    c    This function configures the upconverter to apply IQ (vector) modulation to the RF output signal.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values        Enables or disables IQ (vector) modulation of the RF output signal. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables IQ modulation.
VI_FALSE - Disables IQ modulation.

Default Value: VI_FALSE   U8-   �  �    Instrument Handle                U�#����  �    Status                           V 9 � �       IQ Enabled                             	           True VI_TRUE False VI_FALSE    ;    This function performs a calibration of the IQ modulator.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values   X0-   �  �    Instrument Handle                X�#����  �    Status                                 	           m    This function configures the IQ modulation to allow controlled impairment for test or external corrections.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values    �    Enables or disables IQ impairment. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_ENABLED attribute.

Valid Values: 

VI_TRUE - Enables IQ impairment.
VI_FALSE - Disables IQ impairment.

When you set this parameter to VI_TRUE, the driver applies the following impairment attributes:
 
IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_I_OFFSET
IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_Q_OFFSET
IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_RATIO
IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_SKEW

Default Value: VI_FALSE   Y�-   �  �    Instrument Handle                Z�#����  �    Status                           Z� 9 � �       IQ Impairment Enabled                  	           True VI_TRUE False VI_FALSE    y    This function configures the settings that simulate or correct impairment for the upconverter's IQ (vector) modulation.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None         Return Values     �    Specifies an origin offset voltage to the I signal. The range of allowable values is -100% to +100%. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_I_OFFSET attribute.

Units: Percent (%)

Default Value: 0.0 %     �    Specifies an origin offset voltage to the Q signal. The range of allowable values is -100% to +100%. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_Q_OFFSET attribute.

Units: Percent (%)

Default Value: 0.0 %     �    Specifies the gain imbalance between the I and Q channels. Set this parameter to 0% if you do not want imbalance. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_RATIO attribute.

Units: Percent (%)

Default Value: 0.0 %        Specifies the adjustment of the phase angle between the I and Q vectors. If this skew is zero, the phase angle is 90 degrees. The driver uses this value to set the IVIUPCONVERTER_ATTR_IQ_IMPAIRMENT_SKEW attribute.

Units: Degrees

Default Value: 0.0 Degree   ^#-   �  �    Instrument Handle                ^�#����  �    Status                           ^� 9  �  �    I Offset (%)                     _� 9 � �  �    Q Offset (%)                     `� 9� �  �    Ratio (%)                        a� �  �  �    Skew (deg)                             	           0.0    0.0    0.0    0.0   �    This function sets the value of a ViInt32 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors        Pass the value to which you want to set the attribute.

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
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

Default Value:  ""
   i,-   �  �    Instrument Handle                i�#����  �    Status                           p� � � �  �    Attribute Value                 ���� � ���                                          r� = � � �    Attribute ID                     x  =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViReal64 attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors        Pass the value to which you want to set the attribute.

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
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

Default Value:  ""
   �-   �  �    Instrument Handle                �f#����  �    Status                           �. � � �  �    Attribute Value                 ���� � ���                                          �I = � � �    Attribute ID                     �� =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViString attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors        Pass the value to which you want to set the attribute.

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
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

Default Value:  ""
   �-   �  �    Instrument Handle                ��#����  �    Status                           �� � � �  �    Attribute Value                 ���� � ���                                          �� = � � �    Attribute ID                     � =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViBoolean attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors        Pass the value to which you want to set the attribute.

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
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

Default Value:  ""
   ��-   �  �    Instrument Handle                �L#����  �    Status                           � � � �  �    Attribute Value                 ���� � ���                                          �/ = � � �    Attribute ID                     �z =  �  �    Repeated Capability Name               	               .Press <ENTER> for a list of 
value constants.                0    ""   �    This function sets the value of a ViSession attribute.

This is a low-level function that you can use to set the values of instrument-specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid or is different than the value you specify. 

This instrument driver contains high-level functions that set most of the instrument attributes.  It is best to use the high-level driver functions as much as possible.  They handle order dependencies and multithread locking for you.  In addition, they perform status checking only after setting all of the attributes.  In contrast, when you set multiple attributes using the SetAttribute functions, the functions check the instrument status after each call.

Also, when state caching is enabled, the high-level functions that configure multiple attributes perform instrument I/O only for the attributes whose value you change.  Thus, you can safely call the high-level functions without the penalty of redundant instrument I/O.


     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors        Pass the value to which you want to set the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   ��-   �  �    Instrument Handle                ��#����  �    Status                           ʈ � � �  �    Attribute Value                  ̣ =  �  �    Repeated Capability Name         ʹ = � � �    Attribute ID                    ���� � ���                                                	               ""                0    .Press <ENTER> for a list of 
value constants.   �    This function queries the value of a ViInt32 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �    Returns the current value of the attribute.  Pass the address of a ViInt32 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   �W-   �  �    Instrument Handle                �#����  �    Status                           �� � � �  �    Attribute Value                  ߢ =  �  �    Repeated Capability Name         � = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViReal64 attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �    Returns the current value of the attribute.  Pass the address of a ViReal64 variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
  Attributes with data types other than ViReal64 are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �N-   �  �    Instrument Handle                �#����  �    Status                           �� � � �  �    Attribute Value                  � =  �  �    Repeated Capability Name         � = � � �    Attribute ID                           	           	           ""                0   �    This function queries the value of a ViString attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

You must provide a ViChar array to serve as a buffer for the value.  You pass the number of bytes in the buffer as the Buffer Size parameter.  If the current value of the attribute, including the terminating NUL byte, is larger than the size you indicate in the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you want to call this function just to get the required buffer size, you can pass 0 for the Buffer Size and VI_NULL for the Attribute Value buffer.  

If you want the function to fill in the buffer regardless of the   number of bytes in the value, pass a negative number for the Buffer Size parameter.  

If state caching is available for the instrument driver and you have not disabled caching through MAX or through the optionsString parameter of the IviUpconverter_InitWithOptions function, the IVI Engine caches the string between multiple invokes of this function until the user fetches the whole string. Otherwise, this function queries the instrument to refresh the string attribute value in each function call.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    &    The buffer in which the function returns the current value of the attribute.  The buffer must be of type ViChar and have at least as many bytes as indicated in the Buffer Size parameter.

If the current value of the attribute, including the terminating NUL byte, contains more bytes that you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you specify 0 for the Buffer Size parameter, you can pass VI_NULL for this parameter.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

Default Value:  ""
    �    Pass the number of bytes in the ViChar array you specify for the Attribute Value parameter.  

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
   �a-   �  �    Instrument Handle                 &#����  �    Status or Required Size          � � L � �    Attribute Value                   =  �  �    Repeated Capability Name         - =� �  �    Buffer Size                      # = � � �    Attribute ID                           	           	            ""    512                0   �    This function queries the value of a ViBoolean attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �    Returns the current value of the attribute.  Pass the address of a ViBoolean variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
  Attributes with data types other than ViBoolean are dim. If
  you select an attribute data type that is dim, LabWindows/CVI
  transfers you to the function panel for the corresponding
  function that is consistent with the data type.

- If you want to enter a variable name, press <CTRL-T> to change
  this ring control to a manual input box.

- If the attribute in this ring control has named constants as  
  valid values, you can view the constants by moving to the 
  Attribute Value control and pressing <ENTER>.
   �-   �  �    Instrument Handle                �#����  �    Status                           � � � �  �    Attribute Value                   I =  �  �    Repeated Capability Name         !Z = � � �    Attribute ID                           	           	            ""                0   �    This function queries the value of a ViSession attribute.

You can use this function to get the values of instrument- specific attributes and inherent IVI attributes.  If the attribute represents an instrument state, this function performs instrument I/O in the following cases:

- State caching is disabled for the entire session or for the particular attribute.

- State caching is enabled and the currently cached value is invalid. 

     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    �    Returns the current value of the attribute.  Pass the address of a ViSession variable.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has named constants as valid values, you can view a
  list of the constants by pressing <ENTER> on this control.  
  Select a value by double-clicking on it or by selecting it and 
  then pressing <ENTER>.  
    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   (�-   �  �    Instrument Handle                )�#����  �    Status                           0� � � �  �    Attribute Value                  2F =  �  �    Repeated Capability Name         3W = � � �    Attribute ID                           	           	            ""                0    S    This function checks the validity of a value you specify for a ViInt32 attribute.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   9�-   �  �    Instrument Handle                :W#����  �    Status                           A � � �  �    Attribute Value                  CO =  �  �    Repeated Capability Name        ���� � ���                                          D` = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViReal64 attribute.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   K�-   �  �    Instrument Handle                Ld#����  �    Status                           S, � � �  �    Attribute Value                  U\ =  �  �    Repeated Capability Name        ���� � ���                                          Vm = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    T    This function checks the validity of a value you specify for a ViString attribute.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   ]�-   �  �    Instrument Handle                ^s#����  �    Status                           e; � � �  �    Attribute Value                  gk =  �  �    Repeated Capability Name        ���� � ���                                          h| = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViBoolean attribute.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   o�-   �  �    Instrument Handle                p�#����  �    Status                           wK � � �  �    Attribute Value                  y{ =  �  �    Repeated Capability Name        ���� � ���                                          z� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0    U    This function checks the validity of a value you specify for a ViSession attribute.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    (    Pass the value which you want to verify as a valid value for the attribute.

From the function panel window, you can use this control as follows.

- If the attribute currently showing in the Attribute ID ring
  control has constants as valid values, you can view a list of
  the constants by pressing <ENTER> on this control.  Select a
  value by double-clicking on it or by selecting it and then
  pressing <ENTER>.  

  Note:  Some of the values might not be valid depending on the
  current settings of the instrument session.

Default Value: none    	    If the attribute is repeated capability-based, this parameter specifies the name of the repeated capability on which to set the value of the attribute. If the attribute does not repeated capability-based, then pass VI_NULL or an empty string.

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
   ��-   �  �    Instrument Handle                ��#����  �    Status                           �] � � �  �    Attribute Value                  �� =  �  �    Repeated Capability Name        ���� � ���                                          �� = � � �    Attribute ID                           	               ""    .Press <ENTER> for a list of 
value constants.                0   "    This function performs calibration on the entire device. This call can be blocking or can be non-blocking, depending on the instrument implementation. If the call is non-blocking, you can use the IviUpconverter_IsCalibrationComplete function to determine when the calibration is complete.         Return Values     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   ��#����  �    Status                           ��-   �  �    Instrument Handle                  	                  This function queries the instrument to determine the status of all calibration operations initiated by the IviUpconverter_Calibrate function.

This function returns the Calibration Complete value in the status parameter only when calibration is complete. If some calibration operations are still in progress, the driver returns the Calibration In Progress value. If the driver cannot query the instrument to determine its state, the driver returns the Calibration Status Unknown value.

Note: This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. To check the instrument status, call the IviUpconverter_error_query function at the conclusion of the sequence.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    T    Returns the status of the calibration operation.

Defined Values:
IVIUPCONVERTER_VAL_CALIBRATION_COMPLETE - Calibration complete.

IVIUPCONVERTER_VAL_CALIBRATION_IN_PROGRESS - Calibration in progress.

IVIUPCONVERTER_VAL_CALIBRATION_STATUS_UNKNOWN - Calibration status unknown.

IVIUPCONVERTER_VAL_CALIBRATION_FAILED - Calibration failed.   ��-   �  �    Instrument Handle                �S#����  �    Status                           �j > � �  �    Status                                 	           	           �    This function sends a command to trigger the upconverter. Call this function if you set a trigger source to a software trigger value. Following is a list of attributes and functions that can set the trigger source to a software trigger.

Functions: 
IviUpconverter_ConfigureSweep

Attributes:
IVIUPCONVERTER_ATTR_SWEEP_TRIGGER_SOURCE

Note: This function does not check the instrument status. Typically, you call this function only in a sequence of calls to other low-level driver functions. The sequence performs one operation. You use the low-level functions to optimize one or more aspects of interaction with the instrument. To check the instrument status, call the IviUpconverter_error_query function at the conclusion of the sequence.         Return Values     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �o#����  �    Status                           ��-   �  �    Instrument Handle                  	               �    This function waits until all of the signals flowing through the upconverter have settled. If the signals do not settle within the maximum time you specify, the function returns the Max Time Exceeded error.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
         Return Values    �    Specifies the maximum length of time to allow for this function to complete.

Units:  milliseconds

Defined Values:
IVIUPCONVERTER_VAL_MAX_TIME_IMMEDIATE (0) - The function returns immediately. If the upconverter is not ready, the function returns an error.
IVIUPCONVERTER_VAL_MAX_TIME_INFINITE (-1) - The function waits indefinitely for the upconverter to settle.

Default Value: 5000 ms

Note: This parameter applies only to this function and has no effect on other timeout parameters or attributes.
   ��-   �  �    Instrument Handle                �d#����  �    Status                           �{ 9 � �  �    Maximum Time (ms)                      	           5000   &    This function resets the instrument to a known state and sends initialization commands to the instrument.  The initialization commands set instrument settings such as Headers Off, Short Command form, and Data Transfer Binary to the state necessary for the operation of the instrument driver.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �`#����  �    Status                           �(-   �  �    Instrument Handle                  	                  This function resets the instrument and applies initial user specified settings from the Logical Name which was used to initialize the session.  If the session was created without a Logical Name, this function is equivalent to the IviUpconverter_reset function.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �w#����  �    Status                           �?-   �  �    Instrument Handle                  	               �    This function places the instrument in a quiescent state where it has minimal or no impact on the system to which it is connected.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �#����  �    Status                           ��-   �  �    Instrument Handle                  	               Z    This function runs the instrument's self test routine and returns the test result(s). 

    &    This control contains the value returned from the instrument self test.  Zero means success.  For any other code, see the device's operator's manual.

Self-Test Code    Description
---------------------------------------
   0              Passed self test
   1              Self test failed

     �    Returns the self-test response string from the instrument. See the device's operation manual for an explanation of the string's contents.

You must pass a ViChar array with at least 256 bytes.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �u 9  �  �    Self Test Result                 �� 9 � � ,    Self-Test Message                �m#����  �    Status                           �5-   �  �    Instrument Handle                  	           	            	               `    This function returns the revision numbers of the instrument driver and instrument firmware.

     �    Returns the instrument driver software revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.     �    Returns the instrument firmware revision numbers in the form of a string.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None   �_ 9  �  �    Instrument Driver Revision       �� 9Y �  �    Firmware Revision                �{#����  �    Status                           �C-   �  �    Instrument Handle                  	            	            	               V    This function reads an error code and a message from the instrument's error queue.

     B    Returns the error code read from the instrument's error queue.

     �    Returns the error message string read from the instrument's error message queue.

You must pass a ViChar array with at least 256 bytes.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   �b 9  �  �    Error Code                       լ 9 � � ,    Error Message                    �>#����  �    Status                           �-   �  �    Instrument Handle                  	           	            	               n    This function converts a status code returned by an instrument driver function into a user-readable string.     %    Pass the Status parameter that is returned from any of the instrument driver functions.

Default Value:  0  (VI_SUCCESS)

IviUpconverter Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA1001  The trigger source is not set to software trigger.
BFFA2001  Maximum time exceeded before the operation completed.
BFFA2002  The selected list is not defined.

IVI Engine Status Codes:
Status    Description
-------------------------------------------------
ERRORS:
BFFA0001  Instrument error. Call IviUpconverter_error_query.
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
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors    %    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

You can pass VI_NULL for this parameter.  This is useful when one of the initialize functions fail.

Default Value:  VI_NULL   �> 9  �  h    Error Code                       N 9 � � �    Error Message                    �#����  �    Status                           �-   �  �    Instrument Handle                  0    	            	           VI_NULL    P    This function invalidates the cached values of all attributes for the session.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   2#����  �    Status                           �-   �  �    Instrument Handle                  	               h    This function returns the C session instrument handle you use to call the specific driver's functions.     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     Z    Returns the C session instrument handle you use to call the specific driver's functions.   �-   �  �    Instrument Handle                p#����  �    Status                           8 = � �  �    Specific Driver C Handle               	           	          �    This function retrieves and then clears the IVI error information for the session or the current execution thread. One exception exists: If the BufferSize parameter is 0, the function does not clear the error information. By passing 0 for the buffer size, the caller can ascertain the buffer size required to get the entire error description string and then call the function again with a sufficiently large buffer.

If the user specifies a valid IVI session for the InstrumentHandle parameter, Get Error retrieves and then clears the error information for the session.  If the user passes VI_NULL for the InstrumentHandle parameter, this function retrieves and then clears the error information for the current execution thread.  If the InstrumentHandle parameter is an invalid session, the function does nothing and returns an error. Normally, the error information describes the first error that occurred since the user last called IviUpconverter_GetError or IviUpconverter_ClearError.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Pass the number of bytes in the ViChar array you specify for the Description parameter.

If the error description, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies BufferSize - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Description buffer parameter.

Default Value:  None     �    Returns the error code for the session or execution thread.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.
    �    Returns the error description for the IVI session or execution thread.  If there is no description, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the error description, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass 0 for the Buffer Size, you can pass VI_NULL for this parameter.   #<#����  �    Status or Required Size          *-   �  �    Instrument Handle                *� 9A �  �    BufferSize                       -� 9 R �  �    Code                             .= � Q � �    Description                        	                   	           	           v    This function clears the error code and error description for the IVI session. If the user specifies a valid IVI session for the InstrumentHandle parameter, this function clears the error information for the session. If the user passes VI_NULL for the Vi parameter, this function clears the error information for the current execution thread. If the Vi parameter is an invalid session, the function does nothing and returns an error.
The function clears the error code by setting it to VI_SUCCESS.  If the error description string is non-NULL, the function de-allocates the error description string and sets the address to VI_NULL.

Maintaining the error information separately for each thread is useful if the user does not have a session handle to pass to the IviUpconverter_GetError function, which occurs when a call to IviUpconverter_init or IviUpconverter_InitWithOptions fails.    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
   5�#����  �    Status                           <�-   �  �    Instrument Handle                  	              5    This function returns the interchangeability warnings associated with the IVI session. It retrieves and clears the oldest instance in which the class driver recorded an interchangeability warning.  Interchangeability warnings indicate that using your application with a different instrument might cause different behavior. You use this function to retrieve interchangeability warnings.

The driver performs interchangeability checking when the IVIUPCONVERTER_ATTR_INTERCHANGE_CHECK attribute is set to VI_TRUE.

The function returns an empty string in the Interchange Warning parameter if no interchangeability warnings remain for the session.

In general, the instrument driver generates interchangeability warnings when an attribute that affects the behavior of the instrument is in a state that you did not specify.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Pass the number of bytes in the ViChar array you specify for the Interchange Warning parameter.

If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value. For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Interchange Warning buffer parameter.

Default Value:  None
        Returns the next interchange warning for the IVI session. If there are no interchange warnings, the function returns an empty  string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter. If the next interchangeability warning string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no interchangeability
warnings remain for the session.

   A1#����  �    Status or Required Size          G�-   �  �    Instrument Handle                H� 9 � �  �    Buffer Size                      K� � Q � �    Interchange Warning                	                   	            A    This function clears the list of current interchange warnings.
     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   P%-   �  �    Instrument Handle                P�#����  �    Status                                 	          �    When developing a complex test system that consists of multiple test modules, it is generally a good idea to design the test modules so that they can run in any order.  To do so requires ensuring that each test module completely configures the state of each instrument it uses.  If a particular test module does not completely configure the state of an instrument, the state of the instrument depends on the configuration from a previously executed test module.  If you execute the test modules in a different order, the behavior of the instrument and therefore the entire test module is likely to change.  This change in behavior is generally instrument specific and represents an interchangeability problem.

You can use this function to test for such cases.  After you call this function, the interchangeability checking algorithms in the specific driver ignore all previous configuration operations.  By calling this function at the beginning of a test module, you can determine whether the test module has dependencies on the operation of previously executed test modules.

This function does not clear the interchangeability warnings from the list of previously recorded interchangeability warnings.  If you want to guarantee that the IviUpconverter_GetNextInterchangeWarning function only returns those interchangeability warnings that are generated after calling this function, you must clear the list of interchangeability warnings.  You can clear the interchangeability warnings list by repeatedly calling the IviUpconverter_GetNextInterchangeWarning function until no more interchangeability warnings are returned.  If you are not interested in the content of those warnings, you can call the IviUpconverter_ClearInterchangeWarnings function.
     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors   _-   �  �    Instrument Handle                _�#����  �    Status                                 	          �    This function returns the coercion information associated with the IVI session.  This function retrieves and clears the oldest instance in which the instrument driver coerced a value you specified to another value.

If you set the IVIUPCONVERTER_ATTR_RECORD_COERCIONS attribute to VI_TRUE, the instrument driver keeps a list of all coercions it makes on ViInt32 or ViReal64 values you pass to instrument driver functions.  You use this function to retrieve information from that list.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

The function returns an empty string in the Coercion Record parameter if no coercion records remain for the session.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None    �    Returns the next coercion record for the IVI session.  If there are no coercion records, the function returns an empty string.

The buffer must contain at least as many elements as the value you specify with the Buffer Size parameter.  If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate with the Buffer Size parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

This parameter returns an empty string if no coercion records remain for the session.
    �    Pass the number of bytes in the ViChar array you specify for the Coercion Record parameter.

If the next coercion record string, including the terminating NUL byte, contains more bytes than you indicate in this parameter, the function copies Buffer Size - 1 bytes into the buffer, places an ASCII NUL byte at the end of the buffer, and returns the buffer size you must pass to get the entire value.  For example, if the value is "123456" and the Buffer Size is 4, the function places "123" into the buffer and returns 7.

If you pass a negative number, the function copies the value to the buffer regardless of the number of bytes in the value.

If you pass 0, you can pass VI_NULL for the Coercion Record buffer parameter.

Default Value:  None

   k�#����  �    Status or Required Size          r�-   �  �    Instrument Handle                s� � Q � �    Coercion Record                  v� 9 � �  �    Buffer Size                        	               	               �    This function obtains a multithread lock on the instrument session.  Before it does so, it waits until all other execution threads have released their locks on the instrument session.

Other threads might have obtained a lock on this session in the following ways:

- The user's application called IviUpconverter_LockSession.

- A call to the instrument driver locked the session.

- A call to the IVI engine locked the session.

After your call to IviUpconverter_LockSession returns successfully, no other threads can access the instrument session until you call IviUpconverter_UnlockSession.

Use IviUpconverter_LockSession and IviUpconverter_UnlockSession around a sequence of calls to instrument driver functions if you require that the instrument retain its settings through the end of the sequence.

You can safely make nested calls to IviUpconverter_LockSession within the same thread.  To completely unlock the session, you must balance each call to IviUpconverter_LockSession with a call to IviUpconverter_UnlockSession.  If, however, you use the Caller Has Lock parameter in all calls to IviUpconverter_LockSession and IviUpconverter_UnlockSession within a function, the IVI Library locks the session only once within the function regardless of the number of calls you make to IviUpconverter_LockSession.  This allows you to call IviUpconverter_UnlockSession just once at the end of the function. 
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session.  Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviUpconverter_LockSession or IviUpconverter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviUpconverter_LockSession and IviUpconverter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviUpconverter_LockSession does not lock the session again.  If the value is VI_FALSE, IviUpconverter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviUpconverter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviUpconverter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviUpconverter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviUpconverter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviUpconverter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviUpconverter_LockSession(vi, &haveLock);
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
    IviUpconverter_UnlockSession(vi, &haveLock);
    return error;
}   �#����  �    Status                           ��-   �  �    Instrument Handle                �� 9 � �  �    Caller Has Lock                    	               	            �    This function releases a lock that you acquired on an instrument session using IviUpconverter_LockSession.  Refer to IviUpconverter_LockSession for additional information on session locks.
    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None
        This parameter serves as a convenience.  If you do not want to use this parameter, pass VI_NULL. 

Use this parameter in complex functions to keep track of whether you obtain a lock and therefore need to unlock the session. 
Pass the address of a local ViBoolean variable.  In the declaration of the local variable, initialize it to VI_FALSE.  Pass the address of the same local variable to any other calls you make to IviUpconverter_LockSession or IviUpconverter_UnlockSession in the same function.

The parameter is an input/output parameter.  IviUpconverter_LockSession and IviUpconverter_UnlockSession each inspect the current value and take the following actions:

- If the value is VI_TRUE, IviUpconverter_LockSession does not lock the session again.  If the value is VI_FALSE, IviUpconverter_LockSession obtains the lock and sets the value of the parameter to VI_TRUE.

- If the value is VI_FALSE, IviUpconverter_UnlockSession does not attempt to unlock the session.  If the value is VI_TRUE, IviUpconverter_UnlockSession releases the lock and sets the value of the parameter to VI_FALSE.
 
Thus, you can, call IviUpconverter_UnlockSession at the end of your function without worrying about whether you actually have the lock.  

Example:

ViStatus TestFunc (ViSession vi, ViInt32 flags)
{
    ViStatus error = VI_SUCCESS;
    ViBoolean haveLock = VI_FALSE;

    if (flags & BIT_1)
        {
        viCheckErr( IviUpconverter_LockSession(vi, &haveLock));
        viCheckErr( TakeAction1(vi));
        if (flags & BIT_2)
            {
            viCheckErr( IviUpconverter_UnlockSession(vi, &haveLock));
            viCheckErr( TakeAction2(vi));
            viCheckErr( IviUpconverter_LockSession(vi, &haveLock);
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
    IviUpconverter_UnlockSession(vi, &haveLock);
    return error;
}   �+#����  �    Status                           ��-   �  �    Instrument Handle                �� 9 � �  �    Caller Has Lock                    	               	           �    This function performs the following operations:

- Closes the instrument I/O session.

- Destroys the instrument driver session and all of its attributes.

- Deallocates any memory resources the driver uses.

Notes:

(1) You must unlock the session before calling IviUpconverter_close.

(2) After calling IviUpconverter_close, you cannot use the instrument driver again until you call IviUpconverter_init or IviUpconverter_InitWithOptions.

    �    Returns the status code of this operation.  The status code  either indicates success or describes an error or warning condition.  You examine the status code from each call to an instrument driver function to determine if an error occurred.

To obtain a text description of the status code, or if the status code is not listed below, call the IviUpconverter_error_message function.  To obtain additional information about the error condition, call the IviUpconverter_GetError function.  To clear the error information from the driver, call the IviUpconverter_ClearError function.

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
No defined warnings.
  
ERRORS:
BFFA1001  Trigger source is not set to software trigger.
BFFA2001  Max Time Exceeded.
BFFA2002  List Unknown.

This instrument driver returns errors and warnings defined by other sources.  The following table defines the ranges of additional status codes that this driver can return.  The table lists the different include files that contain the defined constants for the particular status codes:

Numeric Range (in Hex)   Status Code Types    
-------------------------------------------------
3FFA0000 to 3FFA1FFF     IVI    Warnings
3FFF0000 to 3FFFFFFF     VISA   Warnings
3FFC0000 to 3FFCFFFF     VXIPnP Driver Warnings
          
BFFA0000 to BFFA1FFF     IVI    Errors
BFFF0000 to BFFFFFFF     VISA   Errors
BFFC0000 to BFFCFFFF     VXIPnP Driver Errors     �    The ViSession handle that you obtain from the IviUpconverter_init or IviUpconverter_InitWithOptions function.  The handle identifies a particular instrument session.

Default Value:  None   �V#����  �    Status                           �-   �  �    Instrument Handle                  	            ����         @  1�             K.        init                                                                                                                                    ����         32  Qw             K.        InitWithOptions                                                                                                                         ����         SR  V7             K.        ConfigureBypass                                                                                                                         ����         W  Y
             K.        ConfigureIFInputAttenuation                                                                                                             ����         Y�  dy             K.        GetIFInputName                                                                                                                          ����         e�  g|             K.        SetActiveIFInput                                                                                                                        ����         h1  j�             K.        ConfigureRFOutputEnabled                                                                                                                ����         k�  mk             K.        ConfigureRFOutputFrequency                                                                                                              ����         n%  pZ             K.        ConfigureRFOutputGain                                                                                                                   ����         q  s9             K.        ConfigureRFOutputLevel                                                                                                                  ����         s�  �k             K.        ConfigureRFOutputReadyTrigger                                                                                                           ����         �  �X             K.        ConfigureAttenuatorHoldEnabled                                                                                                          ����         �&  �7             K.        GetRFOutputName                                                                                                                         ����         �f  �>             K.        SetActiveRFOutput                                                                                                                       ����         ��  �N             K.        ConfigureAMEnabled                                                                                                                      ����         �  �1             K.        ConfigureAMExternalCoupling                                                                                                             ����         �K  ��             K.        ConfigureAM                                                                                                                             ����         �c  ��             K.        ConfigureFMEnabled                                                                                                                      ����         ��  ��             K.        ConfigureFMExternalCoupling                                                                                                             ����         ��  �]             K.        ConfigureFM                                                                                                                             ����         �N  ��             K.        ConfigurePMEnabled                                                                                                                      ����         �o  �k             K.        ConfigurePMExternalCoupling                                                                                                             ����         ��  �)             K.        ConfigurePM                                                                                                                             ����         �  �v             K.        GetAnalogModulationSourceName                                                                                                           ����         ĥ  �              K.        ConfigurePulseModulationEnabled                                                                                                         ����         ��  ˢ             K.        ConfigurePulseModulationExternalPolarity                                                                                                ����         ��  �             K.        ConfigureSweep                                                                                                                          ����         ��  �             K.        ConfigureFrequencySweepStartStop                                                                                                        ����         �  �             K.        ConfigureFrequencySweepCenterSpan                                                                                                       ����         �  ��             K.        ConfigureFrequencySweepTime                                                                                                             ����         ��  ��             K.        ConfigurePowerSweepStartStop                                                                                                            ����         ��  ��             K.        ConfigurePowerSweepTime                                                                                                                 ����         � �             K.        ConfigureGainSweepStartStop                                                                                                             ����        � ~             K.        ConfigureGainSweepTime                                                                                                                  ����        4 �             K.        ConfigureFrequencyStepStartStop                                                                                                         ����        � �             K.        ConfigureFrequencyStepDwell                                                                                                             ����        � �             K.        ResetFrequencyStep                                                                                                                      ����        H M             K.        ConfigurePowerStepStartStop                                                                                                             ����         �             K.        ConfigurePowerStepDwell                                                                                                                 ����        � �             K.        ResetPowerStep                                                                                                                          ����        W #E             K.        ConfigureGainStepStartStop                                                                                                              ����        $u '�             K.        ConfigureGainStepDwell                                                                                                                  ����        (� )�             K.        ResetGainStep                                                                                                                           ����        *I ,�             K.        CreateFrequencyList                                                                                                                     ����        -� 0b             K.        CreatePowerList                                                                                                                         ����        1� 3�             K.        CreateGainList                                                                                                                          ����        5 8H             K.        CreateFrequencyPowerList                                                                                                                ����        9� <�             K.        CreateFrequencyGainList                                                                                                                 ����        >8 ?V             K.        ClearAllLists                                                                                                                           ����        ?� B�             K.        ConfigureListDwell                                                                                                                      ����        C� E             K.        ResetList                                                                                                                               ����        E� I�             K.        ConfigureALC                                                                                                                            ����        K O�             K.        ConfigureReferenceOscillator                                                                                                            ����        Q' S�             K.        ConfigureReferenceOscillatorOutputEnabled                                                                                               ����        T� W             K.        ConfigureIQEnabled                                                                                                                      ����        W� Y             K.        CalibrateIQ                                                                                                                             ����        Y� \�             K.        ConfigureIQImpairmentEnabled                                                                                                            ����        ]� b�             K.        ConfigureIQImpairment                                                                                                                   ����        dY y1             K.        SetAttributeViInt32                                                                                                                     ����        z� ��             K.        SetAttributeViReal64                                                                                                                    ����        �? �             K.        SetAttributeViString                                                                                                                    ����        �� ��             K.        SetAttributeViBoolean                                                                                                                   ����        �& ��             K.        SetAttributeViSession                                                                                                                   ����        Ԛ �S             K.        GetAttributeViInt32                                                                                                                     ����        � �L             K.        GetAttributeViReal64                                                                                                                    ����        �� �             K.        GetAttributeViString                                                                                                                    ����        = %�             K.        GetAttributeViBoolean                                                                                                                   ����        ': 7�             K.        GetAttributeViSession                                                                                                                   ����        97 I�             K.        CheckAttributeViInt32                                                                                                                   ����        KC [�             K.        CheckAttributeViReal64                                                                                                                  ����        ]R m�             K.        CheckAttributeViString                                                                                                                  ����        oa �             K.        CheckAttributeViBoolean                                                                                                                 ����        �s ��             K.        CheckAttributeViSession                                                                                                                 ����        �� ��             K.        Calibrate                                                                                                                               ����        � ��             K.        IsCalibrationComplete                                                                                                                   ����        �� �L             K.        SendSoftwareTrigger                                                                                                                     ����        �� �{             K.        WaitUntilReady                                                                                                                          ����        �2 ��             K.        reset                                                                                                                                   ����        �h �             K.        ResetWithDefaults                                                                                                                       ����        � ��             K.        Disable                                                                                                                                 ����        � ��             K.        self_test                                                                                                                               ����        �� �             K.        revision_query                                                                                                                          ����        � ��             K.        error_query                                                                                                                             ����        �� �             K.        error_message                                                                                                                           ����        � �             K.        InvalidateAllAttributes                                                                                                                 ����        : �             K.        GetSpecificDriverCHandle                                                                                                                ����        U 19             K.        GetError                                                                                                                                ����        2n =z             K.        ClearError                                                                                                                              ����        =� N�             K.        GetNextInterchangeWarning                                                                                                               ����        O� W�             K.        ClearInterchangeWarnings                                                                                                                ����        X- f�             K.        ResetInterchangeCheck                                                                                                                   ����        g y             K.        GetNextCoercionRecord                                                                                                                   ����        zs ��             K.        LockSession                                                                                                                             ����        �d ��             K.        UnlockSession                                                                                                                           ����        �� ��             K.        close                                                                                                                                                                                                                              �Initialize                                                                           �Initialize With Options                                                             �Configuration Functions                                                             �IF Input                                                                             �Configure Bypass [BP]                                                                �Configure IF Input Attenuation                                                       �Get IF Input Name                                                                    �Set Active IF Input                                                                 ORF Output                                                                            �Configure RF Output Enabled                                                          �Configure RF Output Frequency                                                        �Configure RF Output Gain [OG]                                                        �Configure RF Output Level [OPL]                                                      �Configure RF Output Ready Trigger [ORT]                                              �Configure Attenuator Hold Enabled [AH]                                               �Get RF Output Name                                                                   �Set Active RF Output                                                                �Analog Modulation                                                                   AM                                                                                   �Configure AM Enabled [AM]                                                            �Configure AM External Coupling [AM]                                                  �Configure AM [AM]                                                                   �FM                                                                                   �Configure FM Enabled [FM]                                                            �Configure FM External Coupling [FM]                                                  �Configure FM [FM]                                                                   MPM                                                                                   �Configure PM Enabled [PM]                                                            �Configure PM External Coupling [PM]                                                  �Configure PM [PM]                                                                   �Source                                                                               �Get Analog Modulation Source Name [MS]                                              EPulse Modulation                                                                     �Configure Pulse Modulation Enabled [PULM]                                            �Configure Pulse Modulation External Polarity [PULM]                                 �Sweep                                                                                �Configure Sweep [SWP]                                                               oFrequency Sweep                                                                      �Configure Frequency Sweep Start Stop [FSW]                                           �Configure Frequency Sweep Center Span [FSW]                                          �Configure Frequency Sweep Time [FSW]                                                
Power Sweep                                                                          �Configure Power Sweep Start Stop [PSW]                                               �Configure Power Sweep Time [PSW]                                                    �Gain Sweep                                                                           �Configure Gain Sweep Start Stop [GSW]                                                �Configure Gain Sweep Time [GSW]                                                     -Frequency Step                                                                       �Configure Frequency Step Start Stop [FST]                                            �Configure Frequency Step Dwell [FST]                                                 �Reset Frequency Step [FST]                                                          �Power Step                                                                           �Configure Power Step Start Stop [PST]                                                �Configure Power Step Dwell [PST]                                                     �Reset Power Step [PST]                                                              _Gain Step                                                                            �Configure Gain Step Start Stop [GST]                                                 �Configure Gain Step Dwell [GST]                                                      �Reset Gain Step [GST]                                                               �List                                                                                 �Create Frequency List [LST]                                                          �Create Power List [LST]                                                              �Create Gain List [LST]                                                               �Create Frequency Power List [LST]                                                    �Create Frequency Gain List [LST]                                                     �Clear All Lists [LST]                                                                �Configure List Dwell [LST]                                                           �Reset List [LST]                                                                    vALC                                                                                  �Configure ALC [ALC]                                                                 �Reference Oscillator                                                                 �Configure Reference Oscillator [RO]                                                  �Configure Reference Oscillator Output Enabled [RO]                                  �IQ                                                                                   �Configure IQ Enabled [MIQ]                                                           �Calibrate IQ [MIQ]                                                                  Impairment                                                                           �Configure IQ Impairment Enabled [IQI]                                                �Configure IQ Impairment [IQI]                                                       �Set/Get/Check Attribute                                                             QSet Attribute                                                                        �Set Attribute ViInt32                                                                �Set Attribute ViReal64                                                               �Set Attribute ViString                                                               �Set Attribute ViBoolean                                                              �Set Attribute ViSession                                                             �Get Attribute                                                                        �Get Attribute ViInt32                                                                �Get Attribute ViReal64                                                               �Get Attribute ViString                                                               �Get Attribute ViBoolean                                                              �Get Attribute ViSession                                                             lCheck Attribute                                                                      �Check Attribute ViInt32                                                              �Check Attribute ViReal64                                                             �Check Attribute ViString                                                             �Check Attribute ViBoolean                                                            �Check Attribute ViSession                                                           �Action Functions                                                                     �Calibrate [CAL]                                                                      �Is Calibration Complete [CAL]                                                        �Send Software Trigger [SWT]                                                          �Wait Until Ready                                                                    sUtility Functions                                                                    �Reset                                                                                �Reset With Defaults                                                                  �Disable                                                                              �Self-Test                                                                            �Revision Query                                                                       �Error-Query                                                                          �Error Message                                                                        �Invalidate All Attributes                                                            �Get Specific Driver C Handle                                                        �Error Info                                                                           �Get Error                                                                            �Clear Error                                                                         4Interchangeability Info                                                              �Get Next Interchange Warning                                                         �Clear Interchange Warnings                                                           �Reset Interchange Check                                                             �Coercion Info                                                                        �Get Next Coercion Record                                                            �Locking                                                                              �Lock Session                                                                         �Unlock Session                                                                       �Close                                                                           