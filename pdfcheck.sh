#!/bin/bash

PDF="$1"
OUT_DIR="output_pages"

# 🧾 参数检查
if [ -z "$PDF" ]; then
  echo "⚠️  用法：./split_and_check_fonts.sh path/to/your.pdf"
  exit 1
fi

# 📂 文件存在检查
if [ ! -f "$PDF" ]; then
  echo "❌ PDF 文件 '$PDF' 不存在，请确认路径！"
  exit 1
fi

# 🔍 获取总页数
PAGE_COUNT=$(pdfinfo "$PDF" | grep "Pages" | awk '{print $2}')
echo "📚 文件 '$PDF' 总页数：$PAGE_COUNT 页"

# 📁 创建输出目录
mkdir -p "$OUT_DIR"

# 📝 创建 CSV 汇总文件
CSV_FILE="$OUT_DIR/font_report.csv"
echo "Page,FontName,Type,Embedded,Subset,Unicode,ObjectID" > "$CSV_FILE"

# 🔁 处理每一页
for ((i = 1; i <= PAGE_COUNT; i++)); do
  PAGE_FILE="$OUT_DIR/page$i.pdf"
  pdftk "$PDF" cat $i output "$PAGE_FILE"
  echo "🔍 分析 Page $i ..."

  # 临时保存字体信息
  TEMP_FONT="$OUT_DIR/page$i-fonts.txt"
  pdffonts "$PAGE_FILE" > "$TEMP_FONT"

  # 从第3行开始（跳过表头），解析字体数据加到 CSV
  tail -n +3 "$TEMP_FONT" | while read -r line; do
    echo "$i,$line" >> "$CSV_FILE"
  done
done

echo "✅ 完成！结果保存在：$CSV_FILE"


# Hier, ich habe ein Pdf mit Name ICAS_BF_ICCC25 (6 Seite) als Beispiel gemacht. Nachdem Codelaufen habe wir insg- 6 separat PDF.
