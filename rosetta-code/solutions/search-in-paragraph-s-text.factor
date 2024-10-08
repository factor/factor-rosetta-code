! The goal is to verify the presence of a word or regular expression
! within several paragraphs of text (structured or not) and to format the
! output of the relevant paragraphs before putting them on the standard
! output.
! 
! So here, let’s imagine that we are trying to verify the presence of a
! keyword "SystemError" within what I want to call "the paragraphs"
! "Traceback (most recent call last):" in the file Traceback.txt
! 
!     cat Traceback.txt :
! 
!     2018-06-19 23:19:34,877 ERROR Processes plugin raised an exception.
!     Traceback (most recent call last):
!       File "/usr/lib/python3/dist-packages/landscape/sysinfo/sysinfo.py", line 99, in run
!         result = plugin.run()
!       File "/usr/lib/python3/dist-packages/landscape/sysinfo/processes.py", line 18, in run
!         for process_info in info.get_all_process_info():
!       File "/usr/lib/python3/dist-packages/landscape/lib/process.py", line 39, in get_all_process_info
!         process_info = self.get_process_info(process_id)
!       File "/usr/lib/python3/dist-packages/landscape/lib/process.py", line 61, in get_process_info
!         cmd_line = file.readline()
!       File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
!         return codecs.ascii_decode(input, self.errors)[0]
!     UnicodeDecodeError: 'ascii' codec can't decode byte 0xc5 in position 152: ordinal not in range(128)
! 
!     2018-06-19 23:19:34,877 ERROR Processes plugin raised an exception.
!     Traceback (most recent call last):
!         vmodl.fault.SystemError: (vmodl.fault.SystemError) {
!         dynamicType = ,
!         dynamicProperty = (vmodl.DynamicProperty) [],
!         msg = 'A general system error occurred: Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.',
!         faultCause = ,
!         faultMessage = (vmodl.LocalizableMessage) [],
!         reason = 'Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.'
!         }
! 
!     [Tue Jan 21 16:16:19.250245 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] Traceback (most recent call last):
!     [Tue Jan 21 16:16:19.252221 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] SystemError: unable to access /home/dir
!     [Tue Jan 21 16:16:19.249067 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] mod_wsgi (pid=6515): Failed to exec Python script file '/home/pi/RaspBerryPiAdhan/www/sysinfo.wsgi'.
!     [Tue Jan 21 16:16:19.249609 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] mod_wsgi (pid=6515): Exception occurred processing WSGI script '/home/pi/RaspBerryPiAdhan/www/sysinfo.wsgi'.
! 
!     [Tue Jan 21 17:16:19.250245 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] Traceback (most recent call last):
!     [Tue Jan 21 17:16:19.250679 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757]   File "/home/pi/RaspBerryPiAdhan/www/sysinfo.wsgi", line 5, in <module>
!     [Tue Jan 21 17:16:19.251735 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757]     from test import app as application
!     [Tue Jan 21 17:16:19.252221 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] ImportError: cannot import name app
! 
!     2021-04-23 17:13:14,425 ERROR    Network plugin raised an exception.
!     Traceback (most recent call last):
!       File "/usr/lib/python3/dist-packages/landscape/sysinfo/sysinfo.py", line 99, 
!     in run
!         result = plugin.run()
!       File "/usr/lib/python3/dist-packages/landscape/sysinfo/network.py", line 36, 
!     in run
!         device_info = self._get_device_info()
!       File "/usr/lib/python3/dist-packages/landscape/lib/network.py", line 163, in 
!     get_active_device_info
!         speed, duplex = get_network_interface_speed(
!       File "/usr/lib/python3/dist-packages/landscape/lib/network.py", line 249, in 
!     get_network_interface_speed
!         res = status_cmd.tostring()
!     AttributeError: 'array.array' object has no attribute 'tostring'
! 
!     11/01 18:24:57.726 ERROR| log:0072| post-test sysinfo error: 11/01 18:24:57.727 ERROR| traceback:0013| Traceback (most recent call last): 11/01 18:24:57.728 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/common_lib/log.py", line 70, in decorated_func 11/01 18:24:57.729 ERROR| traceback:0013| fn(*args, **dargs) 11/01 18:24:57.730 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/bin/base_sysinfo.py", line 286, in log_after_each_test 11/01 18:24:57.731 ERROR| traceback:0013| old_packages = set(self._installed_packages) 11/01 18:24:57.731 ERROR| traceback:0013| TypeError: 'NoneType' object is not iterable
! 
!     12/01 19:24:57.726 ERROR| log:0072| post-test sysinfo error: 11/01 18:24:57.727 ERROR| traceback:0013| Traceback (most recent call last): 11/01 18:24:57.728 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/common_lib/log.py", line 70, in decorated_func 11/01 18:24:57.729 ERROR| traceback:0013| fn(*args, **dargs) 11/01 18:24:57.730 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/bin/base_sysinfo.py", line 286, in log_after_each_test 11/01 18:24:57.731 ERROR| traceback:0013| old_packages = set(self._installed_packages) 11/01 18:24:57.731 ERROR| traceback:0013| SystemError: no such file or directory
! 
!     Traceback (most recent call last):
!         File "/usr/lib/vmware-vpx/vsan-health/pyMoVsan/VsanClusterPrototypeImpl.py", line 1492, in WaitForUpdateTask
!         WaitForTask(task)
!         File "/usr/lib/vmware-vpx/pyJack/pyVim/task.py", line 123, in WaitForTask
!         raise task.info.error
!         vmodl.fault.SystemError: (vmodl.fault.SystemError) {
!         dynamicType = ,
!         dynamicProperty = (vmodl.DynamicProperty) [],
!         msg = 'A general system error occurred: Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.',
!         faultCause = ,
!         faultMessage = (vmodl.LocalizableMessage) [],
!         reason = 'Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.'
!         }
! 
! The expected result must be formated with ---------------- for
! paragraph's separator AND "Traceback (most recent call last):" as the
! beginning of each relevant's paragraph :
! 
!     Traceback (most recent call last):
!         vmodl.fault.SystemError: (vmodl.fault.SystemError) {
!         dynamicType = ,
!         dynamicProperty = (vmodl.DynamicProperty) [],
!         msg = 'A general system error occurred: Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.',
!         faultCause = ,
!         faultMessage = (vmodl.LocalizableMessage) [],
!         reason = 'Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.'
!         }
!     ----------------
!     Traceback (most recent call last):
!     [Tue Jan 21 16:16:19.252221 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] SystemError: unable to access /home/dir
!     [Tue Jan 21 16:16:19.249067 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] mod_wsgi (pid=6515): Failed to exec Python script file '/home/pi/RaspBerryPiAdhan/www/sysinfo.wsgi'.
!     [Tue Jan 21 16:16:19.249609 2020] [wsgi:error] [pid 6515:tid 3041002528] [remote 10.0.0.12:50757] mod_wsgi (pid=6515): Exception occurred processing WSGI script '/home/pi/RaspBerryPiAdhan/www/sysinfo.wsgi'.
!     ----------------
!     Traceback (most recent call last): 11/01 18:24:57.728 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/common_lib/log.py", line 70, in decorated_func 11/01 18:24:57.729 ERROR| traceback:0013| fn(*args, **dargs) 11/01 18:24:57.730 ERROR| traceback:0013| File "/tmp/sysinfo/autoserv-0tMj3m/bin/base_sysinfo.py", line 286, in log_after_each_test 11/01 18:24:57.731 ERROR| traceback:0013| old_packages = set(self._installed_packages) 11/01 18:24:57.731 ERROR| traceback:0013| SystemError: no such file or directory
!     ----------------
!     Traceback (most recent call last):
!         File "/usr/lib/vmware-vpx/vsan-health/pyMoVsan/VsanClusterPrototypeImpl.py", line 1492, in WaitForUpdateTask
!         WaitForTask(task)
!         File "/usr/lib/vmware-vpx/pyJack/pyVim/task.py", line 123, in WaitForTask
!         raise task.info.error
!         vmodl.fault.SystemError: (vmodl.fault.SystemError) {
!         dynamicType = ,
!         dynamicProperty = (vmodl.DynamicProperty) [],
!         msg = 'A general system error occurred: Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.',
!         faultCause = ,
!         faultMessage = (vmodl.LocalizableMessage) [],
!         reason = 'Unable to complete Sysinfo operation. Please see the VMkernel log file for more details.: Sysinfo error: Bad parameterSee VMkernel log for details.'
!         }
!     ----------------


