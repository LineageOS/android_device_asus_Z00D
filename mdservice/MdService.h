#include <binder/BinderService.h>

extern "C" void _ZN7android5intel19MultiDisplayService11instantiateEv();
using namespace android;

void instantiateAndJoinThreadPool(void) {
    _ZN7android5intel19MultiDisplayService11instantiateEv();
    ProcessState::self()->startThreadPool();
    IPCThreadState::self()->joinThreadPool();
}
