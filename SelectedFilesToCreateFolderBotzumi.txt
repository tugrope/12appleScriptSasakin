(*
このAppleScriptは、Finder内で特定のフォルダを作成し、選択されたファイルやフォルダをその中に移動するためのメインロジックを含んでいます。
主な役割は、選択された項目を新しいフォルダ"ボツ・済"に移動することです。
以下の主要なステップを含みます:
1. 選択されたフォルダまたはファイルの確認
2. 新しいフォルダ"ボツ・済"の作成
3. 同じ名前のフォルダが存在する場合の上書き確認
4. 選択された項目の移動

このコードは、特定の条件下でのエラーハンドリングも行います。
詳細な実装については、各ステップのコメントを参照してください。
*)

tell application "Finder"
    if (count of (get selection)) > 0 then
        set selectedItems to selection
        set targetFolder to item 1 of selectedItems as alias
    else
        set selectedItems to {}
        set targetFolder to (target of front window) as alias
    end if

    set newFolderName to "ボツ・済"
    set folderExists to (exists folder newFolderName of targetFolder)

    if folderExists then
        display dialog "同じ名前のフォルダがあります。\n上書きしますか？" buttons {"いいえ", "はい"} default button "いいえ"
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

    if (count of selectedItems) > 0 then
        set newFolder to folder newFolderName of targetFolder
        repeat with anItem in selectedItems
            move anItem to newFolder
        end repeat
    end if
end tell