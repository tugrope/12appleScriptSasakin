--[�X�N���v�g�̋@�\����]
-- ���̃X�N���v�g�́A�ȉ��̑�������s���܂�:
-- 1. Finder�őI������Ă��鍀�ڂ�����ꍇ:
--    �E�I�����ꂽ���ڂ̐e�t�H���_�ɐV�K�t�H���_�u�v�E�ρv���쐬���܂��B
--    �E�V�K�t�H���_�u�v�E�ρv�̒��ɑI�����ꂽ���ڂ��ړ����܂��B
-- 2. Finder�ŉ����I������Ă��Ȃ��ꍇ:
--    �E�A�N�e�B�u��Finder�E�C���h�E�̃^�[�Q�b�g�t�H���_���ɐV�K�t�H���_�u�v�E�ρv���쐬���܂��B
-- ���̃X�N���v�g�́AFinder�̑I����Ԃɉ����ď_��ɓ��삵�܂��B

tell application "Finder"
	try
		-- �A�N�e�B�u��Finder�E�C���h�E�őI������Ă��鍀�ڂ��擾
		set theSelection to selection
		
		-- �V�K�t�H���_��
		set newFolderName to "�v�E��"
		
		if theSelection �� {} then
			-- �������I������Ă���ꍇ
			-- �I�����ꂽ���ڂ̐e�t�H���_���擾
			set parentFolder to container of item 1 of theSelection
			
			-- �V�K�t�H���_���쐬
			set newFolder to make new folder at parentFolder with properties {name:newFolderName}
			
			-- �I�����ꂽ�e���ڂ�V�����t�H���_�Ɉړ�
			repeat with selectedItem in theSelection
				move selectedItem to newFolder
			end repeat
			
			-- �������b�Z�[�W��\��
			display dialog "�V�����t�H���_ '" & newFolderName & "' ���쐬���A�I���������ڂ����܂����B" buttons {"OK"} default button "OK"
		else
			-- �����I������Ă��Ȃ��ꍇ
			-- �A�N�e�B�u��Finder�E�C���h�E�̃^�[�Q�b�g�t�H���_���擾
			set targetFolder to target of Finder window 1
			
			-- �^�[�Q�b�g�t�H���_�ɐV�K�t�H���_���쐬
			set newFolder to make new folder at targetFolder with properties {name:newFolderName}
			
			-- �������b�Z�[�W��\��
			display dialog "�V�����t�H���_ '" & newFolderName & "' ���쐬���܂����B" buttons {"OK"} default button "OK"
		end if
		
	on error errMsg
		-- �G���[�n���h�����O
		display dialog "�G���[���������܂���: " & errMsg buttons {"OK"} default button "OK"
	end try
end tell
