# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Custom OTA commands for ASUS ZENFONE 4 5 6 devices"""
"""Custom OTA commands for ASUS ZENFONE device Z25xx"""
import common
import struct

def FullOTA_PostValidate(info):
	info.script.Print("Validate system partitions now ...")
	# run e2fsck
	info.script.AppendExtra('run_program("/sbin/e2fsck", "-fy", "/dev/block/mmcblk0p9");');
	info.script.Print("Resize . . .")
	# resize2fs: run and delete
	info.script.AppendExtra('run_program("/tmp/install/bin/resize2fs_static", "/dev/block/mmcblk0p9");');
	info.script.Print("Run e2fsck . . .")
	# run e2fsck
	info.script.AppendExtra('run_program("/sbin/e2fsck", "-fy", "/dev/block/mmcblk0p9");');

def FullOTA_InstallEnd(info):
  info.script.script = [cmd for cmd in info.script.script if not "boot.img" in cmd]
  info.script.AppendExtra('write_osip_image(package_extract_file("boot.img"), "/dev/block/by-name/boot");')
