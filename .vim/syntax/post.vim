" Vim syntax file
" Language: Program to Optimize Simulated Trajectories (POST) Input Files
" Maintainer: Forrest Ward
" Latest Revision: 30 September 2018

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "post"

hi def link postDefine Constant
hi def link postPreProc PreProc
hi def link postKeyword Statement
hi def link postComment Comment

syn match postDefine ".*" contained

syn match postPreProc "^\*if def" nextgroup=postDefine skipwhite
syn match postPreProc "^\*endif"
syn match postPreProc "^\*else"
syn match postPreProc "^\*define" nextgroup=postDefine skipwhite

syn match postKeyword "^\*declare"
syn match postKeyword "^\*include"

syn match postComment "#.*$"

