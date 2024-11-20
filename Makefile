#
# Copyright (C) 2020 Xiaomi Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include $(APPDIR)/Make.defs

CSRCS += $(wildcard common/*.c)
CSRCS += $(wildcard modules/*.c)
CSRCS += $(wildcard modules/dsp/*.c)
CSRCS += $(wildcard modules/imgproc/*.c)
CSRCS += $(wildcard modules/math/*.c)
CSRCS += $(wildcard modules/physics/*.c)

ASRCS += $(wildcard modules/dsp/*.s)
ASRCS += $(wildcard modules/imgproc/*.s)
ASRCS += $(wildcard modules/math/*.s)
ASRCS += $(wildcard modules/physics/*.s)

FLAGS += -Iinc
FLAGS += -Icommon
FLAGS += -Imodules/math

FLAGS += -D__MACH__

FLAGS += -DENABLE_NE10_FIR_FLOAT_NEON
FLAGS += -DENABLE_NE10_FIR_DECIMATE_FLOAT_NEON
FLAGS += -DENABLE_NE10_FIR_INTERPOLATE_FLOAT_NEON
FLAGS += -DENABLE_NE10_FIR_LATTICE_FLOAT_NEON
FLAGS += -DENABLE_NE10_FIR_SPARSE_FLOAT_NEON
FLAGS += -DENABLE_NE10_IIR_LATTICE_FLOAT_NEON

FLAGS += -DENABLE_NE10_IMG_ROTATE_RGBA_NEON

FLAGS += -DENABLE_NE10_PHYSICS_COMPUTE_AABB_VEC2F_NEON
FLAGS += -DENABLE_NE10_PHYSICS_RELATIVE_V_VEC2F_NEON
FLAGS += -DENABLE_NE10_PHYSICS_APPLY_IMPULSE_VEC2F_NEON

FLAGS += -DNE10_ENABLE_DSP
FLAGS += -DNE10_ENABLE_IMGPROC
FLAGS += -DNE10_ENABLE_MATH
FLAGS += -DNE10_ENABLE_PHYSICS

FLAGS += -DNE10_UNROLL_LEVEL=1

AFLAGS += $(FLAGS)
CFLAGS += $(FLAGS)

include $(APPDIR)/Application.mk
