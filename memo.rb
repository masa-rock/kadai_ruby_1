require "csv"

# readlineで読み込んだ文を\nを省いた形で中に入れておく用
new_content = []

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.chomp

if memo_type == "1"
    p "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    file_name = file_name+".csv"
    p "メモしたい内容を入力してください"
    p "完了したらCtrl + Dを押します。"
    content = readlines
    
    # 複数行のinputから\nを省く
    content.each do |con|
        new_content << con.chomp
    end
    
    # csvファイルを作成する
    CSV.open(file_name,'w') do |data|
        data << new_content
    end
    
elsif memo_type == "2"
    p "編集したいファイル名を拡張子を除いて入力してください"
    file_name = gets.chomp
    file_name = file_name+".csv"
    p "編集したい内容を入力してください"
    p "完了したらCtrl + Dを押します。"
    content = readlines
    
    content.each do |con|
        new_content << con.chomp
    end
    
    # csvファイルに追記する
    CSV.open(file_name,'a') do |data|
        data << new_content
    end
    
else 
    p "1,2以外の文字が入力されました。"
end