def ruby_mode
  # playは 2：選択形式
    
  # {question: "出題内容", answer: "正回答", dummy1: "誤回答", dummy2: "誤回答", answer_num: question:を除いて、正回答は左から何番目か},
    [
      {question: "「include?メソッド」の説明で正しいのはどれ？", answer: "引数で指定した要素が、配列中に含まれているか判定して、「true」or「false」で返す", dummy1: "引数で指定した要素が、配列中に含まれているか判定して、「値」で返す", dummy2: "配列やハッシュなどから、ある条件にあった要素だけを取り出す", answer_num: 1},
      {question: "変数名を「sample」とした時、スコープ範囲は定義したメソッド内だけで変数を扱いたい！どれを使う？", dummy1: "@sample", answer: "sample", dummy2: "@@sample", answer_num: 2},
      {question: "元となる配列自体を変更して、配列の最初の要素を削除したい！どのメソッドを使う？", dummy1: "unshiftメソッド", dummy2: "firstメソッド", answer: "shiftメソッド", answer_num: 3},
      {question: "配列に入っている要素の数を知りたい！当てはまらないメソッドはどれ？", answer: "countメソッド", dummy1: "lenghメソッド", dummy2: "sizeメソッド", answer_num: 1},
      {question: "配列の最後に「要素」 を追加したい！「<<」以外の方法は？", dummy1: "配列.last(要素)", answer: "配列.unshift(要素)", dummy2: "配列.push(要素)", answer_num: 2},
      {question: "ループ処理している時に条件に当てはまったら処理を抜けるのは「break」。では、条件に当てはまったら次の処理をスキップして更にループ処理を続けさせるのはどれ？", dummy1: "step", dummy2: "redo", answer: "next", answer_num: 3},
      {question: "ハッシュの配列「 array = [{a: 1, b: 2}, {a: 3, b: 4}] 」から配列[1, 3]を作成したい！どうする？ ", answer: "array.map { |h| h[:a] }", dummy1: "array.map { |h| h[:b] }", dummy2: "array.values", answer_num: 1},
    ]
  end