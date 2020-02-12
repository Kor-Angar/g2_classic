###################################
##      ������������ ������      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            ��������           ##
###################################

!define MOD_VERSION "0.9"
!define MOD_DATE "1.13"
!define MOD_NAME_SYS "g2_classic"
!define MOD_NAME_RU "������ II - ������������"
!define MOD_DETAILED_VERSION "${MOD_VERSION}.${MOD_DATE}"
!define MOD_AUTHOR "D36, Kor Angar"
!define INSTALLER_NAME "${MOD_NAME_SYS}_v${MOD_VERSION}_install"
!define UNINSTALLER_NAME "${MOD_NAME_SYS}_uninstall"

Name "${MOD_NAME_SYS}_v${MOD_VERSION}"
OutFile "${INSTALLER_NAME}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${INSTALLER_VERSION}"
VIAddVersionKey "LegalCopyright" "� ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME_RU}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

Unicode true
SetCompressor lzma

###################################
##      ��������� ����������     ##
###################################

!define MUI_ICON "g2_classic.ico"
!define MUI_UNICON "g2_classic.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME_RU} (v${MOD_VERSION}) - ���������"
!define MUI_TEXT_WELCOME_INFO_TITLE " "
!define MUI_TEXT_WELCOME_INFO_TEXT "������ ����������� �������� ��� ��������� ������������ ������ 2 ��� ������ '���� ������'. ��������� ������������� �� ������� ������ �������� ������� �� ������ � ������������� Player Kit. ���������� �� ���� � ������� �� ��������������: ������ ����� ���� �����������!"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "��������� ��������� ����������� � ��������� �����. \
$\n$\n����� ���������� ����������� � ������ �����, ������� ������ '����� ...' � ������� ��."

!define MUI_COMPONENTSPAGE_NODESC
SpaceTexts none

!define MUI_TEXT_INSTALLING_TITLE "����������� ������..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\t��������� ���������!"
!define MUI_TEXT_FINISH_INFO_TEXT "�������� ����! ������� ������ '������' ��� ����������."

UninstallCaption "${MOD_NAME_RU} - ��������"

!define MUI_UNTEXT_COMPONENTS_TITLE "����� ����������� ��� ��������"
!define MUI_UNTEXT_COMPONENTS_SUBTITLE " "

!define MUI_UNTEXT_FINISH_INFO_TITLE " "
!define MUI_UNTEXT_FINISH_INFO_TEXT "��� ��������� ���������� ����������� ������� �� ����� � �����. ������� ������ '������' ��� ����������."

BrandingText " "

###################################
##     ��������  ������������    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##    ��������  ��������������   ##
###################################

!define MUI_COMPONENTSPAGE_TEXT_TOP "�������� ���������� �����������, ������� �� ������ �������. ������� ������ '�������' ��� �����������."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "���������� ��� ��������:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             �����             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##            �������            ##
###################################

!macro GMF_Delete FILENAME
	IfFileExists "${FILENAME}" "" +2
	Delete "${FILENAME}"
!macroend

###################################
##          �����������          ##
###################################

Section "�������� �����" SecMain
	SectionIn RO
	CreateDirectory "$INSTDIR\saves_g2_classic\current"

	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2_classic.mod"

	SetOutPath "$INSTDIR\system"
	File "g2_classic.ico"
	File "g2_classic.ini"
	File "g2_classic.rtf"

	SetOutPath "$INSTDIR\_work\Data\Video"
	File "Credits_Classic.bik"

	SetOutPath "$INSTDIR"
	File "g2_classic_readme.txt"

	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"

	WriteRegStr HKCU "Software\${MOD_NAME_SYS}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "DisplayName" "${MOD_NAME_RU} (v${MOD_VERSION})" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "DisplayVersion" "${MOD_DETAILED_VERSION}" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "InstallLocation" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "HelpLink" "http://github.com/dosinabox/g2_classic"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "DisplayIcon" "$INSTDIR\system\g2_classic.ico"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}" "EstimatedSize" "149000"
SectionEnd


###################################
##         �������������         ##
###################################

Section "Un.������� �����������" SecUninstall_Main
	SectionIn RO
	Call Un.GMF_Delete_Components
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME_SYS}"
SectionEnd

Section /o "Un.������� ����������" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_g2_classic"
SectionEnd

###################################
##            �������            ##
###################################

Function .onInit
	SetSilent normal
	!insertmacro MUI_LANGDLL_DISPLAY
	ReadRegStr $INSTDIR HKCU "Software\${MOD_NAME_SYS}" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	StrCpy $INSTDIR "$PROGRAMFILES\Akella\Gothic II"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\GothicStarter.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd

Function Un.GMF_Delete_Components
	!insertmacro GMF_Delete "$INSTDIR\g2_classic_readme.txt"
	!insertmacro GMF_Delete "$INSTDIR\system\g2_classic.ico"
	!insertmacro GMF_Delete "$INSTDIR\system\g2_classic.ini"
	!insertmacro GMF_Delete "$INSTDIR\system\g2_classic.rtf"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2_classic.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2_classic_hotfix.mod"
	!insertmacro GMF_Delete "$INSTDIR\_work\Data\Video\Credits_Classic.bik"
FunctionEnd
