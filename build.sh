# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/P-404/android_manifest -b shinka -g default,-mips,-darwin,-notdefault
git clone https://github.com/p404-vayu/local_manifest --depth=1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch p404_vayu-userdebug
export WITH_GAPPS=true
export TZ=Asia/Kolkata #put before last build command
make bacon
