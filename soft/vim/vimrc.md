# vimrc



```

"���ñ���  
set encoding=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
set fileencodings=utf-8,ucs-bom,chinese  
  
"��������  
set langmenu=zh_CN.UTF-8  
  
"�����к�  
set nu  
  
"�����﷨����  
syntax enable  
syntax on  
  
"������ɫ����  
colorscheme  desert  
  
"������buffer���κεط�ʹ�����  
set mouse=a  
set selection=exclusive  
set selectmode=mouse,key  
  
"������ʾƥ�������  
set showmatch  
  
"ȥ��viһ����  
set nocompatible  
  
"��������  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set autoindent  
set cindent  
if &term=="xterm"  
    set t_Co=8  
    set t_Sb=^[[4%dm  
    set t_Sf=^[[3%dm  
endif  
  
"���ļ������Զ���⹦��  
filetype on  
  
"����taglist  
let Tlist_Show_One_File=0   "��ʾ����ļ���tags  
let Tlist_File_Fold_Auto_Close=1 "�ǵ�ǰ�ļ��������б��۵�����  
let Tlist_Exit_OnlyWindow=1 "��taglist�����һ������ʱ�˳�vim  
let Tlist_Use_SingleClick=1 "����ʱ��ת  
let Tlist_GainFocus_On_ToggleOpen=1 "��taglistʱ������뽹��  
let Tlist_Process_File_Always=1 "����taglist�����Ƿ�򿪣�ʼ�ս����ļ��е�tag  
  
"����WinManager���  
let g:winManagerWindowLayout='FileExplorer|TagList'  
nmap wm :WMToggle<cr>  
map <silent> <F9> :WMToggle<cr> "��F9����WinManager,����WimManager  
  
"����CSCOPE  
set cscopequickfix=s-,c-,d-,i-,t-,e- "�趨�Ƿ�ʹ��quickfix������ʾcscope���  
  
"����Grep���  
nnoremap <silent> <F3> :Grep<CR>  
  
"����һ������  
map <F6> :make<CR>  
  
"�����Զ���ȫ  
filetype plugin indent on   "���ļ����ͼ��  
set completeopt=longest,menu "�ص����ܲ�ȫʱ��Ԥ������  
  
"����vimʱ�������tags���Զ�����  
if exists("tags")  
    set tags=./tags  
endif  
  
"���ð�F12�͸���tags�ķ���  
map <F12> :call Do_CsTag()<CR>  
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>  
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>  
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>  
function Do_CsTag()  
        let dir = getcwd()  
        if filereadable("tags")  
            if(g:iswindows==1)  
                let tagsdeleted=delete(dir."\\"."tags")  
            else  
                let tagsdeleted=delete("./"."tags")  
            endif  
            if(tagsdeleted!=0)  
                echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None  
                return  
            endif  
        endif  
          
        if has("cscope")  
            silent! execute "cs kill -1"  
        endif  
          
        if filereadable("cscope.files")  
            if(g:iswindows==1)  
                let csfilesdeleted=delete(dir."\\"."cscope.files")  
            else  
                let csfilesdeleted=delete("./"."cscope.files")  
            endif  
            if(csfilesdeleted!=0)  
                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None  
                return  
            endif  
        endif  
                                              
        if filereadable("cscope.out")  
            if(g:iswindows==1)  
                let csoutdeleted=delete(dir."\\"."cscope.out")  
            else  
                let csoutdeleted=delete("./"."cscope.out")  
            endif  
            if(csoutdeleted!=0)  
                echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None  
                return  
            endif  
        endif  
                                              
        if(executable('ctags'))  
            "silent! execute "!ctags -R --c-types=+p --fields=+S *"  
            silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."  
        endif  
              
        if(executable('cscope') && has("cscope") )  
            if(g:iswindows!=1)  
                silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"  
            else  
                silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"  
            endif  
            silent! execute "!cscope -b"  
            execute "normal :"  
                                                                      
            if filereadable("cscope.out")  
                execute "cs add cscope.out"  
            endif  
        endif  
endfunction  
  
"����Ĭ��shell  
set shell=bash  
  
"����VIM��¼����ʷ��  
set history=400  
  
"���õ��ļ����ⲿ�ı��ʱ���Զ������ļ�  
if exists("&autoread")  
    set autoread  
endif  
  
"����ambiwidth  
set ambiwidth=double  
  
"�����ļ�����  
set ffs=unix,dos,mac  
  
"������������ģʽ  
set incsearch  
  
"���þ���ģʽ  
set noerrorbells  
set novisualbell  
set t_vb=  
  
"��Ҫ�����ļ�  
set nobackup  
set now  





```
