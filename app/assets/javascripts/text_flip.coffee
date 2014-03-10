# Обработка анимации перелистывания букв в заголовках блоков
$ ->
  $("#news_container h3").flipper()
  $("#reasons_container h3").flipper()


# Разбирает заголовок по кусочкам и у каждого из них запускает анимацию перелистывания
# @example $("#reasons_container h3").flipper()
$.fn.flipper = () ->
  $this = $(this)
  target = display_flipper($this)

  # Дает время карте подгрузиться, после чего включает анимацию, либо просто отображает на мобилах
  setTimeout (->
    if app.mobile == true
      target.find("span").removeClass "hidden"
    else
      target.find("span").each ->
        do_the_filp($(this))
  ), 2000


# Разбирает заголовок по кусочкам, превращая их в отдельные спаны
# @note берет значение из data-flip, чтобы корректно считывать только настоящие символы
# @note length определяет, сколько будет спанов
# @param heading [DOM element] заголовок, который нужно разобрать
# @return [DOM element] переделанный заголовок
display_flipper = (heading) ->
  length = 17
  text = heading.attr("data-flip")
  text_array = text.split("")
  text_array.push "&#160" while text_array.length < length

  result = $("<h3 class='flip'>")
  result.html "<span class='hidden'>" + text_array.join("</span><span class='hidden'>") + "</span>"

  #TODO: сделать так, чтобы сначала были видны пустые прямоугольники
  parent_container = heading.parent()
  parent_container.prepend(result)
  heading.remove()
  result


# Запускает анимацию перелистывания букв
# @note i определяется случайно, чтобы каждый символ по-разному анимировался
do_the_filp = (span)->

  all_letters = "ABCDEFGHIJKLMNOPQRSTUVXYZ,.?!01234567890«»-():'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ "
  span_letter = span.html().toUpperCase()
  span.html("").removeClass("hidden")

  i = Math.floor((Math.random()*20))

  flipper_interval = setInterval(->
    span.html(all_letters[i])
    if span_letter == all_letters[i]
      clearInterval flipper_interval
    else
      i += 1
  , 30)