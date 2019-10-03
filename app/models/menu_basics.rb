require 'ncurses'


begin
  scr = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.noecho
  Ncurses.keypad(scr, true)
  Ncurses.start_color

  choices = [ "Choice 1",
              "Choice 2",
              "Choice 3",
              "Choice 4",
              "Exit" ]

  menu_items = []

  choices.each_with_index do | choice, index |
    menu_items << Ncurses::Menu::ITEM.new(choice, "")
  end

  menu = Ncurses::Menu::MENU.new(menu_items)
  menu.post_menu
  Ncurses.refresh

  ch = Ncurses.getch
  while ch != Ncurses::KEY_EXIT
    if ch == Ncurses::KEY_UP
      menu.menu_driver(Ncurses::Menu::REQ_UP_ITEM)
    elsif ch == Ncurses::KEY_DOWN
      menu.menu_driver(Ncurses::Menu::REQ_DOWN_ITEM)
    elsif 10
      if menu.current_item.item_name == "Exit"
        break
      end
    end
    ch = Ncurses.getch
  end


ensure
  Ncurses.echo
  Ncurses.nocbreak
  Ncurses.nl
  Ncurses.endwin
end