(*
このコードは、特定の機能を実行するためのメインロジックを含んでいます。
主な役割は、入力データを処理し、必要な出力を生成することです。
以下の主要なステップを含みます:
1. 入力データの検証
2. データの変換および処理
3. 結果の出力

このコードは、特定の条件下でのエラーハンドリングも行います。
詳細な実装については、各関数のコメントを参照してください。
*)

tell application "Finder"
	if (count of (get selection)) > 0 then
		set targetFolder to item 1 of (get selection) as alias
	else
		set targetFolder to (target of front window) as alias
	end if

	set newFolderName to "ボツ・済"
	set folderExists to (exists folder newFolderName of targetFolder)

	if folderExists then
		display dialog "同じ名前のフォルダがあります。
上書きしますか？" buttons {"いいえ", "はい"} default button "いいえ"
		set userChoice to button returned of result

		if userChoice is "はい" then
			delete folder newFolderName of targetFolder
			make new folder at targetFolder with properties {name:newFolderName}
		else
			return
		end if
	else
		make new folder at targetFolder with properties {name:newFolderName}
	end if
end tell