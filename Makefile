ifndef PROSPERODEV
$(error PROSPERODEV, is not set)
endif

target := prospero_lib
OutPath := lib
TargetFile := libz
AllTarget = $(OutPath)/$(TargetFile).a 

include $(PROSPERODEV)/make/prosperosdk.mk
CompilerFlags += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D_BSD_SOURCE
CompilerFlagsCpp += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D_BSD_SOURCE


$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(PROSPERODEV)/usr/lib
	@cp include/png.h $(PROSPERODEV)/usr/include/prospero
	@cp include/pngconf.h $(PROSPERODEV)/usr/include/prospero
	@cp include/pnglibconf.h $(PROSPERODEV)/usr/include/prospero
	@cp include/pngstruct.h $(PROSPERODEV)/usr/include/prospero
	@cp include/pnginfo.h $(PROSPERODEV)/usr/include/prospero
	@echo "$(TargetFile) Installed!"

