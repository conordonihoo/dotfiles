" =====================================================
" About:
"   Define syntax highlighting in vim for config files
" Author:
"   Conor Donihoo   <conor.donihoo@fireflyspace.com>
" =====================================================

if exists("b:current_syntax")
  finish
endif

" First word
syn match configFirstWord /^\<[a-zA-Z0-9_-]\+\>/ containedin=configKeywords,configfunction
hi! def link configFirstWord String

" Tokens
syn match configToken "\k\@<!@\k\S*"
hi! link configToken Identifier

" Keywords
syn keyword configKeywords ON OFF ENABLED DISABLED MIN MAX AUTO PRESS VENT EQUAL true false END N MAXIMUM RESET_SLOPE_ONLY START_SAVING RESET_HEIGHT_AND_SLOPE STOP_SAVING START_SENDING_FILE_REWIND STOP_SENDING_FILE START_SENDING_FILE_RESUME START_SAVING_APPEND CRYO_PRESS
hi! link configKeywords Type
syn match configCamKeyword /\<USE_S[0-9]_CAM[0-9]\>/ containedin=configfunction
hi! link configCamKeyword Type
syn match configNaKeyword  "n\/a"
hi! link configNaKeyword Type

" States
syn keyword configUniqueStates POWER_ON SAFE MANUAL TERMINAL_COUNT PRE_RELEASE_SHUTDOWN S1_ENG_IGNITION RELEASE S1_ASCENT PRE_SEPARATION S1_SHUTDOWN STAGE_SEP PASSIVATION EMERGENCY_SHUTDOWN
hi! link configUniqueStates Keyword
syn match configPreBurnState /\<PRE_S[0-9]_BURN_[0-9]\>/ containedin=configfunction
hi! link configPreBurnState Keyword
syn match configBurnState /\<S[0-9]_BURN_[0-9]\>/ containedin=configfunction
hi! link configBurnState Keyword
syn match configShutdownState /\<S[0-9]_ENG_SHUTDOWN_[0-9]\>/ containedin=configfunction
hi! link configShutdownState Keyword
syn match configCoastState /\<COAST_[0-9]\>/ containedin=configfunction
hi! link configCoastState Keyword
syn match configDeployState /\<PAYLOAD_DEPLOY_[0-9]\>/ containedin=configfunction
hi! link configDeployState Keyword
syn match configThrustTermState /\<S[0-9]_THRUST_TERMINATION\>/ containedin=configfunction
hi! link configThrustTermState Keyword

" GNC
syn match configGNC /\<GNC\S\+\>/ containedin=configFirstWord,configfunction
hi! link configGNC Special
syn keyword configGNCRelated FIRST_STAGE_ENGINE_OFF FIRST_STAGE_ENGINE_ON HOLDDOWN_RELEASE STAGE_SEPARATION SECOND_STAGE_ENGINE_ON SECOND_STAGE_ENGINE_OFF FAIRING_SEPARATION RCS_PULSE_SETTLE_ON RCS_PULSE_SETTLE_OFF RCS_DELTA_V_ON RCS_DELTA_V_OFF
hi! link configGNCRelated Special

" Paths
syn match configPath /\v(^|\s)\/\S+/
hi link configPath Special

" Numbers
syn match configNumbers "\v[+\-]?%(0|[1-9]\d*)%(\.\d*)?%([eE][+\-]?\d+)?" containedin=confignumber
hi link configNumbers Number

hi! link configfunction NONE
