#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Telegram_FirstCFG()

Telegram_FirstCFG() {
	msgbox [PT-BR] Abra um chat com o "BotFather" no telegram e crie um bot, após criar o bot copie e cole o Token que o "BotFather" lhe enviou.`n`n[EN] Create Bot with "BotFather" in telegram and Copy+Paste Token in next step. 
	loop
	{
		InputBox, botToken, enter the in telegram indicated bot token, 
		MsgBox, 4, , Bot Token correct?:`n%botToken%
			IfMsgBox Yes
				break
	}
	
	Random, SecurityCode, 1000, 9999
	msgbox [PT-BR]Agora, abra um chat com o Bot que voce acabou de criar e envie a mensagem %SecurityCode% `nPRESSIONE OK QUANDO TERMINAR. `n`n[EN]now open a new chat with your new created bot (search for @*yourbotname* and start a new chat) and enter this number %SecurityCode% and send it via telegram `npress OK, when done.
	UrlDownloadToFile https://api.telegram.org/bot%BotToken%/getupdates , %A_Temp%\findChatID.txt
	sleep 2000
	run %A_Temp%\findChatID.txt
	msgbox [PT-BR]Procure pelo seu ID, ele vem depois do "chat":{"id":782163891 `n`n[EN]now search for the number %SecurityCode% and on the same line there should be something like: "chat":{"id":782163891`n`nfound it? press ok
	InputBox ChatID, enter the number after "chat":{"id": here:
	IniWrite, %botToken%, %A_ScriptDir%\TelegramBotConfigs.ini, TelegramBot, botToken
	IniWrite, %chatID%, %A_ScriptDir%\TelegramBotConfigs.ini, TelegramBot, chatID
	MsgBox, Done.
	exitapp
}