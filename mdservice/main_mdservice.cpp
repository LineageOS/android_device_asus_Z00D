#include <binder/BinderService.h>
#include <MdService.h>

using namespace android;

int main(void) {
    signal(SIGPIPE, SIG_IGN);
    instantiateAndJoinThreadPool();
    return 0;
}
