# /etc/csh.login
#if(-r /etc/csh.cshrc) then
#    source /etc/csh.login
#endif

# /etc/csh.cshrc
#if(-r /etc/csh.cshrc) then
#    source /etc/csh.cshrc
#endif

# Digital design team
umask 027

# for remove the message " HOSTNAME undefined" when connect through ssh
if ($?HOSTNAME == 0) then
    setenv HOSTNAME $HOST
endif

# cz
# foreground/normal intensity
set   black_fg="%{\033[30m%}"
set     red_fg="%{\033[31m%}"
set   green_fg="%{\033[32m%}"
set  yellow_fg="%{\033[33m%}"
set    blue_fg="%{\033[34m%}"
set magenta_fg="%{\033[35m%}"
set    cyan_fg="%{\033[36m%}"
set   white_fg="%{\033[37m%}"
# background/normal intensity
set   black_bg="%{\033[40m%}"
set     red_bg="%{\033[41m%}"
set   green_bg="%{\033[42m%}"
set  yellow_bg="%{\033[43m%}"
set    blue_bg="%{\033[44m%}"
set magenta_bg="%{\033[45m%}"
set    cyan_bg="%{\033[46m%}"
set   white_bg="%{\033[47m%}"
# foreground/high intensity
set   black_fh="%{\033[90m%}"
set     red_fh="%{\033[91m%}"
set   green_fh="%{\033[92m%}"
set  yellow_fh="%{\033[93m%}"
set    blue_fh="%{\033[94m%}"
set magenta_fh="%{\033[95m%}"
set    cyan_fh="%{\033[96m%}"
set   white_fh="%{\033[97m%}"
# background/high intensity
set   black_bh="%{\033[100m%}"
set     red_bh="%{\033[101m%}"
set   green_bh="%{\033[102m%}"
set  yellow_bh="%{\033[103m%}"
set    blue_bh="%{\033[104m%}"
set magenta_bh="%{\033[105m%}"
set    cyan_bh="%{\033[106m%}"
set   white_bh="%{\033[107m%}"
# attributes
set    reset_at="%{\033[0m%}"
set     bold_at="%{\033[1m%}"
set    faint_at="%{\033[2m%}"
set   italic_at="%{\033[3m%}"
set   unders_at="%{\033[4m%}"
set   blinks_at="%{\033[5m%}"
set   blinkr_at="%{\033[6m%}"
set negative_at="%{\033[7m%}"
set  conceal_at="%{\033[8m%}"
set   underd_at="%{\033[21m%}"
set   normal_at="%{\033[22m%}"
set   undern_at="%{\033[24m%}"
set   blinkn_at="%{\033[25m%}"
set positive_at="%{\033[27m%}"
set   reveal_at="%{\033[28m%}"
set      end_at="%{\033[0m%}"

if ($?STY == 1) then
    # screen session
    set prompttype='S'
else if ($?SSH_CONNECTION == 1) then
    # ssh session
    set prompttype='R'
else
    set prompttype=''
endif
set promptchars='$#'
set prompt="${black_fh}%Y.%W/%D[${end_at}${red_fh}$user@%m${end_at} ${blue_fh}%/${end_at}${black_fh}]${prompttype}${end_at}%# "

if ($?CZ_PATH == 0) then
    setenv CZ_PATH
    setenv PATH "/bin"
    setenv PATH "${PATH}:${HOME}/.local/bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/vim_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/emacs_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/ctags_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/python_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/perl_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/acro_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/terminator_bin"
    setenv PATH "${PATH}:/data/FS-MCU/.portal/__tool__/meld_bin"
    setenv PATH "${PATH}:/usr/lib64/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/usr/X11R6/bin"

    if ($?LD_LIBRARY_PATH == 0) then
        setenv LD_LIBRARY_PATH
    endif

    # under the time back
    setenv CZ_CHK_TB

    # license
    source /data/FS-MCU2/00.ENV/ia.license.cz2
endif

if ($?DISPLAY == 0) then
    if(-r ~/.cz_display) then
        foreach mydisplay(`cat ~/.cz_display`)
        end
        setenv DISPLAY $mydisplay
        #if($?SSH_CONNECTION == 0) then
        #    echo "get DISPLAY" $mydisplay
        #endif
    else if(-r /data/FS-MCU/.portal/.cz_display)
        foreach mydisplay(`cat /data/FS-MCU/.portal/.cz_display`)
        end
        setenv DISPLAY $mydisplay
        #if($?SSH_CONNECTION == 0) then
        #    echo "get DISPLAY" $mydisplay
        #endif
    else
        #if($?SSH_CONNECTION == 0) then
        #    echo "undefined DISPLAY" $mydisplay
        #endif
    endif
else
    if($?SSH_CONNECTION == 0) then
        #echo "defined DISPLAY" $DISPLAY
        echo 'setenv DISPLAY' $DISPLAY > ~/.cz_display
        echo 'setenv DISPLAY' $DISPLAY > /data/FS-MCU/.portal/.cz_display
    endif
endif

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias em 'emacs'
alias pa 'setenv PATH "${HOME}/.local/Adobe/Reader9/bin:${HOME}/.local/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin"'
alias sl 'pa;source /data/FS-MCU_ES2/00.ENV/00.LICENSE/ia.license.cz'
alias ul '~/Works/license/getserver/update_license'
alias vi 'gvim'
alias gt 'gnome-terminal'

set autolist

if($?SSH_CONNECTION == 0) then
    # current time
    #set current_time = `date`
    #echo "Now is $current_time"

    # welcome
    echo "______________________________________________________________________________"
    echo ""
    echo "  _/          _/  _/_/_/_/  _/          _/_/_/    _/_/    _/      _/  _/_/_/_/"
    echo " _/          _/  _/        _/        _/        _/    _/  _/_/  _/_/  _/       "
    echo "_/    _/    _/  _/_/_/    _/        _/        _/    _/  _/  _/  _/  _/_/_/    "
    echo " _/  _/  _/    _/        _/        _/        _/    _/  _/      _/  _/         "
    echo "  _/  _/      _/_/_/_/  _/_/_/_/    _/_/_/    _/_/    _/      _/  _/_/_/_/    "
    echo ""
    echo "     _/_/_/  _/    _/  _/_/_/  _/_/_/_/_/  _/      _/    _/_/                 "
    echo "  _/        _/    _/    _/          _/      _/  _/    _/    _/                "
    echo " _/        _/_/_/_/    _/        _/          _/      _/_/_/_/                 "
    echo "_/        _/    _/    _/      _/            _/      _/    _/                  "
    echo " _/_/_/  _/    _/  _/_/_/  _/_/_/_/_/      _/      _/    _/                   "
    echo "______________________________________________________________________________"
    echo ""
    #echo " __    __  __ __   ___  ___         __     ___       _____ _____     _   "
    #echo "/ / /\ \ \/__\ /  / __\/___\/\/\   /__\   / __\/\  /\\_   \ _  /\_/\/_\  "
    #echo "\ \/  \/ /_\/ /  / /  //  //    \ /_\    / /  / /_/ / / /\\// /\_ _//_\\ "
    #echo " \  /\  //__ /___ /___ \_// /\/\ \/__   / /___ __  /\/ /_  / //\/ \  _  \"
    #echo "  \/  \/\__\____\____\___/\/    \\__/   \____\/ /_/\____/ /____/\_\_/ \_/"
    #echo ""
endif

