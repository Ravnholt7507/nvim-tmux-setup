This is my personal bash and vim setup. 
Feel free to use it aswell.

#Git autocompleteion:
In .bashrc on line 109, there is a source of the __git_complete. This has to be included in your .bashrc, if it complains of __git_complete does not exist.
This error happens because the use of __git_complete happens before the git autocomplete file has been sourced.

#TODO:
- Make installation automatic
    - Could perhaps be done with a simple bash script, or maybe even with ansible
    - each part (i3, vim and bash) should be optional
    - pdf.sh doesnt install on all distros??

req: 
sudo apt install ranger
pip install tldr
