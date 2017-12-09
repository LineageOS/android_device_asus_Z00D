/*
** Copyright 2016, The CyanogenMod Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "log.h"
#include "property_service.h"
#include "util.h"
#include "vendor_init.h"

#define BUF_SIZE 64

/* Intel props */
#define IFWI_PATH       "/sys/kernel/fw_update/fw_info/ifwi_version"
#define CHAABI_PATH     "/sys/kernel/fw_update/fw_info/chaabi_version"
#define MIA_PATH        "/sys/kernel/fw_update/fw_info/mia_version"
#define SCU_BS_PATH     "/sys/kernel/fw_update/fw_info/scu_bs_version"
#define SCU_PATH        "/sys/kernel/fw_update/fw_info/scu_version"
#define IA32FW_PATH     "/sys/kernel/fw_update/fw_info/ia32fw_version"
#define VALHOOKS_PATH   "/sys/kernel/fw_update/fw_info/valhooks_version"
#define PUNIT_PATH      "/sys/kernel/fw_update/fw_info/punit_version"
#define UCODE_PATH      "/sys/kernel/fw_update/fw_info/ucode_version"
#define PMIC_NVM_PATH   "/sys/kernel/fw_update/fw_info/pmic_nvm_version"
#define WATCHDOG_PATH   "/sys/devices/virtual/misc/watchdog/counter"
#define OSRELEASE_PATH  "/proc/sys/kernel/osrelease"

static int read_file2(const char *fname, char *data, int max_size)
{
    int fd, rc;

    if (max_size < 1)
        return 0;

    fd = open(fname, O_RDONLY);
    if (fd < 0) {
        ERROR("failed to open '%s'\n", fname);
        return 0;
    }

    rc = read(fd, data, max_size -1);
    if ((rc > 0) && (rc < max_size ))
        data[rc] = '\0';
    else
        data[0] = '\0';
    data[strcspn(data, "\n")] = 0;
    close(fd);

    return 1;
}

static void intel_props() {

    char buf[BUF_SIZE];

    if(read_file2(IFWI_PATH, buf, sizeof(buf))) {
            property_set("sys.ifwi.version", buf);
    }

    if(read_file2(CHAABI_PATH, buf, sizeof(buf))) {
            property_set("sys.chaabi.version", buf);
    }

    if(read_file2(MIA_PATH, buf, sizeof(buf))) {
            property_set("sys.mia.version", buf);
    }

    if(read_file2(SCU_BS_PATH, buf, sizeof(buf))) {
            property_set("sys.scubs.version", buf);
    }

    if(read_file2(SCU_PATH, buf, sizeof(buf))) {
            property_set("sys.scu.version", buf);
    }

    if(read_file2(IA32FW_PATH, buf, sizeof(buf))) {
            property_set("sys.ia32.version", buf);
    }

    if(read_file2(VALHOOKS_PATH, buf, sizeof(buf))) {
            property_set("sys.valhooks.version", buf);
    }

    if(read_file2(PUNIT_PATH, buf, sizeof(buf))) {
            property_set("sys.punit.version", buf);
    }

    if(read_file2(UCODE_PATH, buf, sizeof(buf))) {
            property_set("sys.ucode.version", buf);
    }

    if(read_file2(PMIC_NVM_PATH, buf, sizeof(buf))) {
            property_set("sys.pmic.nvm.version", buf);
    }

    if(read_file2(WATCHDOG_PATH, buf, sizeof(buf))) {
            property_set("sys.watchdog.previous.counter", buf);
    }

    if(read_file2(OSRELEASE_PATH, buf, sizeof(buf))) {
            property_set("sys.kernel.version", buf);
    }

}

void vendor_load_properties()
{
    intel_props();
}
