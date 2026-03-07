--@strip-comments@
-- Translator ZamestoTV v1.0.0 - 1.4.2
---@type string, table
local _, ns = ...

---@class DLP_ns
local G_DLP = ns

---@class DLP_Locale
local L = LibStub("AceLocale-3.0"):NewLocale(G_DLP.localeName, "ruRU")
if not L then
	return
end

--- Place newest translations/locale keys at the top, wrapped in --#region and --#endregion for the version number that they were added in.
--- You may translate these comments, but do not translate "region" or "endregion" as they are used by the localization tool to determine where to place the translations.
--- To add translations, simply uncomment the line(s) and replace the English text after the equal sign (=) with the translated value.

--#region 1.0.0 - 1.4.2
-- L["OPTIONS_SPECS_DESC"] = "If you'd like to have different layouts for specific specializations, you can set overrides here."
-- L["OPTIONS_SPECS_PRESET_DESC"] = "The Edit Mode preset to load in %s spec."
L["DO_NOT_OVERRIDE"] = "То же, что и предустановка по умолчанию"
L["ERROR_LAYOUT_INVALID"] = "Не найден действительный макет. Посетите настройки аддона (/dlp), чтобы выбрать действующую предустановку режима редактирования."
L["ERROR_NO_LAYOUT_INFO"] = "Возникла проблема с получением информации о макете при запуске, пожалуйста, сообщите об этой проблеме на GitHub."
L["ERROR_NO_SPEC_INFO"] = "Возникла проблема с получением информации о специализации при запуске, пожалуйста, сообщите об этой проблеме на GitHub."
L["EVENT_CREATED_LAYOUT"] = "Обнаружен новый макет! Посетите настройки аддона (/dlp), чтобы использовать этот макет в ваших предустановках."
L["EVENT_DELETED_LAYOUT"] = "Похоже, ваш выбранный макет был удалён. Посетите настройки аддона (/dlp), чтобы выбрать новую предустановку для этого устройства и/или специализаций."
L["LAYOUT_TYPE_DEVICE"] = "Устройство"
L["LAYOUT_TYPE_SPEC"] = "Специализация"
L["OPTIONS_DESC"] = "Автоматически переключать макеты интерфейса с помощью режима редактирования Blizzard, когда вы играете на нескольких устройствах. Это простой аддон, но он справляется со своей задачей."
L["OPTIONS_HOWTO_CONCLUSION"] = "\nТеперь, когда вы играете на SteamDeck утром и на ПК вечером, вам не придётся вручную менять предустановки режима редактирования!"
L["OPTIONS_HOWTO_NAME"] = "Как использовать"
L["OPTIONS_HOWTO_STEP0"] = "0. Создайте несколько предустановок режима редактирования, по одной для каждого устройства (например, Steam Deck, ноутбука, ПК и т.д.)."
L["OPTIONS_HOWTO_STEP1"] = "1. Установите этот аддон на все устройства, на которых вы играете."
L["OPTIONS_HOWTO_STEP2"] = "2. Установите ниже «Предустановка по умолчанию для загрузки» на макет, который вы хотите для каждого устройства."
L["OPTIONS_PRESET_DESC"] = "Предустановка режима редактирования, которая будет загружаться при входе в игру на этом устройстве или при переключении на специализацию, для которой ниже не определено переопределение."
L["OPTIONS_PRESET_NAME"] = "Предустановка по умолчанию для загрузки"
L["OPTIONS_SPECS_NAME"] = "Переопределения специализации класса"
L["SUCCESS_LOADED_LAYOUT"] = "Успешно загружен ваш макет %s: «%s» — Приятной игры!"
L["WELCOME_NEW_VERSION"] = "Спасибо за использование DeviceLayoutPreset %s!"
--#endregion
