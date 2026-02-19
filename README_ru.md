<h1 align='center'>
BeeTux Макро ☃️
</h1>

<p align='center'>
Макро для Bee Swarm с открытым исходным кодом. Поддерживает любые оболочки на Wayland (не Mutter) 🐧 

</p> 
<p align='center'>

  
  <a href="https://wikipedia.org/wiki/Bash_(Unix_shell)">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white" />
</a>

<a href="https://wikipedia.org/wiki/Linux">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" />
</a>
  
  <a href="https://t.me/NextTimeUsername">
<img src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" />  
</a>

  <a href="https://github.com/painvision/BeeTuxMacro/stargazers">
  <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/painvision/BeeTuxMacro?style=for-the-badge" />
  </a>

</p>

> [!WARNING]
> Если вы встретились с багами, откройте проблему, сделайте пул реквест, или свяжитесь со мной через [Телеграм](https://t.me/NextTimeUsername). [🇷🇺/🇺🇸]

<h1 align='center'>
Установка
</h1>

### Установка зависимостей

- Arch-подобные дистрибутивы:
```
sudo pacman -S ydotool imagemagick bc xorg-xrandr grim
```
- Debian-подобные дистрибутивы:
```
sudo apt install ydotool imagemagick bc xorg-xrandr grim
```
### Откройте терминал. Клонируйте этот репозиторий:

```
git clone https://github.com/painvision/BeeTuxMacro/
```

<h1 align='center'>
Конфигурация 
</h1>

Пока что нету графического интерфейса для настроек

Редактируй файл `~/BeeTuxMacro/config.sh` вашим любимым текстовым редактором

<h1 align='center'>
Настройка
</h1>

> [!WARNING]
> Разрешение экрана ДОЛЖНО быть 100%, роблокс на полном экране и ничего не должно его переграждать 

Вам нужно рабочий ydotoold в фоне, чтобы скрипт мог взаимодействовать вашей клавиатурой. **Можно добавить в автостарт, так как в простое ydotool жрёт всего 4 мегабайта памяти** Лучший способ запустить демон ydotool:
```
sudo /usr/bin/ydotoold --socket-path="/run/user/1000/.ydotool_socket" --socket-own="1000:1000"
```

Если ydotoold работает, макрос готов. Команда для старта/стопа
```
bash -c ~/BeeTuxMacro/start.sh
```
Найдите способ установить горячую клавишу на выполнение команды в вашем окружении

<h1 align='center'>
Обзор
</h1>

| Поля              | Функции                                  | Улучшения для пользователя (бля дальше лень переводить)                                            | Codebase  |
| ------------------- | ----------------------------------------- | ---------------------------------------------- |---------- |
| ✅ Pine Tree Forest | ✅ Авто копание                               | ❌ GUI for settings instead of notifications   | ❌ Image recognition function (python)
| ✅ Rose Field       | ✅ Авто поливалка                         | ⏳ Macro releases instead of git repo          | ❌ Image instability function 
| ✅ Pumpkin Field    | ✅ Авто Wealth Clock                      | ❌ Telegram bot hooking                        | ❌ Detect no pollen increase (image instability function)
| ✅ Pineapple Field  | ✅ Авто Пряничный Домик                 | ❌ Pause/resume macro                          | ❌ Fixing camera position after reset (recognition function)
| ❌ Stump Field      | ✅ Авто Носки                        | ❌❌ Claim hive function                       | ❌ Recalculate path walking time OR not walking at all when haste is active (recognition)
| ⏳ Strawberry Field | ✅ Авто Honey Wreath                      |                                                | ❌ Auto reconnect (recognition function)
| ❌ Bamboo Field     | ✅ Бег на основе walkspeedd  |                                                | ❌ Rewrite walking functions for better code understanding and reading
| ❌ Cactus Field     | ❌ Авто Whirligig                         |                                                |
|                     | ❌ Авто Микро конвертер 

Проверенные оболочки и оконные менеджеры

| Оболочки | Статус | Объяснение
| ----- | ------ | ------------
| Hyprland | Работает идеально ✅ | Это моя оболочка, с которой я работаю над макросом
| GNOME | Не работает ❌ | Mutter. Может быть починен кстати
| KDE Plasma | Не проверено |
| Cinnamon | Не проверено

<p align='center'>
Если вам интересен макрос, поставьте звезду репозиторию. Это мотивирует меня  💞
</p>
