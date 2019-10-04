require 'ncurses'


begin

  def show_window(window, label, color)
    window.box(0, 0)
    window.attron(Ncurses.COLOR_PAIR(color))
    window.addstr(label)
    window.attroff(Ncurses.COLOR_PAIR(color))
    window.refresh
  end

  scr = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.noecho
  Ncurses.keypad(scr, true)
  Ncurses.start_color

  lines = 10
  cols = 40
  windows = []
  panels = []

  Ncurses.init_pair(1, Ncurses::COLOR_CYAN,  Ncurses::COLOR_BLACK)
  Ncurses.init_pair(2, Ncurses::COLOR_GREEN, Ncurses::COLOR_BLACK)
  Ncurses.init_pair(3, Ncurses::COLOR_BLUE,  Ncurses::COLOR_BLACK)

  x = 10
  y = 2

  3.times do |i|
    windows << Ncurses::WINDOW.new(lines, cols, y, x)
    show_window(windows[i], "window #{i + 1}", i + 1)
    y += 3
    x += 7
  end

  windows.each_with_index do |window, index|
    panels[index] = Ncurses::Panel::PANEL.new(window)
  end

  Ncurses::Panel.update_panels
  Ncurses.doupdate

  top = 2

  ch = scr.getch

  while ch != Ncurses::KEY_DOWN
    if ch == Ncurses::KEY_RIGHT
      top == panels.size - 1 ? top = 0 : top += 1
      Ncurses::Panel.top_panel(panels[top])
    elsif ch == Ncurses::KEY_LEFT
      top == 0 ? top = panels.size - 1 : top -= 1
      Ncurses::Panel.top_panel(panels[top])
    end
    Ncurses::Panel.update_panels
    Ncurses.doupdate
    ch = scr.getch
  end


ensure
  Ncurses.echo
  Ncurses.nocbreak
  Ncurses.nl
  Ncurses.endwin
end