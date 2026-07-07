#!/bin/bash

# 出力するHTMLファイル名
OUTPUT_FILE="index.html"

# HTMLのヘッダー部分を書き込み
cat << 'EOF' > "$OUTPUT_FILE"
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>スライド一覧</title>
    <style>
        body { font-family: sans-serif; margin: 40px; line-height: 1.6; background-color: #f9f9f9; }
        h1 { color: #333; border-bottom: 2px solid #ccc; padding-bottom: 10px; }
        ul { list-style: none; padding: 0; }
        li { margin: 8px 0; }
        a { display: inline-block; text-decoration: none; color: #0066cc; font-size: 18px; padding: 4px 8px; border-radius: 4px; }
        a:hover { background-color: #e0f0ff; text-decoration: underline; }
        .icon { margin-right: 8px; }
    </style>
</head>
<body>

    <h1>スライド一覧</h1>
    <ul>
EOF

# ls コマンドでループを回し、リンクを生成
# ※ 自分自身（スクリプト）と出力先の HTML は除外します
for item in $(ls -1); do
    if [ "$item" != "$OUTPUT_FILE" ] && [ "$item" != "$(basename "$0")" ]; then
        
        # ディレクトリかファイルかでアイコンを切り替える
        if [ -d "$item" ]; then
            ICON="📁"
            LINK="$item/"
            echo "        <li><a href=\"$LINK\"><span class=\"icon\">$ICON</span>$item</a></li>" >> "$OUTPUT_FILE"
        fi
    fi
done

# HTMLのフッター部分を書き込み
cat << 'EOF' >> "$OUTPUT_FILE"
    </ul>

</body>
</html>
EOF

echo "✨ $OUTPUT_FILE を生成しました！"
