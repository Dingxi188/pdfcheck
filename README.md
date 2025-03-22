# 📝 pdfcheck – PDF Font Checker


Papers often have font requirements. We use this document to split the entire document into pages and then check the fonts.论文很多时候有字体要求，我们通过本文件把整个文件拆成一页一页的，然后检查字体
一个轻量级的 Bash 脚本，用于将 PDF 拆分为单页，并检查每一页所使用的字体。  
A lightweight Bash script to split a PDF into single pages and check the fonts used on each page.  
Ein leichtgewichtiges Bash-Skript, das eine PDF-Datei in Einzelseiten aufteilt und die verwendeten Schriftarten prüft.

---
# Step 1: 克隆项目 Clone the repo (or download the script)
git clone https://github.com/你的用户名/你的仓库名.git
cd 你的仓库名/scripts

# Step 2: 将脚本重命名（可选） Rename the script (optional)
mv pdfcheck.sh pdfcheck

# Step 3: 赋予执行权限 Make the script executable
chmod +x pdfcheck


#注意注意注意: 注意要使用cd 命令找到pdfcheck脚本的位置。再用./pdfcheck ../ICAS_BF_ICCC25.pdf  


./pdfcheck/ 空格 /完整的pdf路径文件.pdf     #初始化结束后，你就可以使用了。
                                        #只要输入你的pdf的路径。 摁住键盘option之后双指点击屏幕。可以复制文件路径。
z.B ./pdfcheck    /Users/xiding/Downloads/ICAS_BF_ICCC25luca.pdf 




