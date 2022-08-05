#!/bin/bash
export ARCH=arm64

CLANG_DIR=$HOME/toolchain/clang
export KBUILD_BUILD_USER="zclkkk"
export KBUILD_BUILD_HOST="workspace"
export PATH=${CLANG_DIR}/bin:${PATH}
args="                  ARCH=arm64 \
                        CC=${CLANG_DIR}/bin/clang \
                        CLANG_TRIPLE=aarch64-linux-gnu- \
                        CROSS_COMPILE=${HOME}/toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android- \
                        CROSS_COMPILE_ARM32=${HOME}/toolchain/arm-linux-androideabi-4.9/bin/arm-linux-androideabi- "

target=alioth_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=apollo_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=cas_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=cmi_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=lmi_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=thyme_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}

target=umi_defconfig
make ${target} ${args}
make savedefconfig ${args}
mv defconfig arch/${ARCH}/configs/${target}
make mrproper ${args}
git restore *.i
