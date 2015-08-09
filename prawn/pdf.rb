require 'prawn'

Prawn.debug = true

# 中文字体支持
file_simsun = File.expand_path(File.join(File.dirname(__FILE__), 'fonts/simsun.ttf'))
file_simsun_bold = File.expand_path(File.join(File.dirname(__FILE__), 'fonts/simsun_bold.ttf'))

Prawn::Document.generate("hello.pdf") do

  font_families["simsun"] = {
    normal: { file: file_simsun },
    bold: { file: file_simsun_bold }
  }

  move_down 25

  font('simsun', size: 40, style: :bold) do
    text "智慧狮数据日报", align: :center

    move_down 25

    text "2014-03-15", align: :center
  end

  move_down 50

  red = "FA000A"
  green = "137002"

  data = [
    ["开通企业数/渠道", "82/21"],
    ["增开企业数", "0"],
    ["累积用户数(变化)", "7546(<color rgb='#{red}'>+46</color>)"],
    ["今日活跃度", "12.8%(<color rgb='#{green}'>-3.6%</color>)"],
    ["当日人均课程消耗数", "1.16(<color rgb='#{red}'>+0.04</color>)"],
    ["新增问题/答案/点赞", "33/341/349"]
  ]

  font('simsun', size: 25, style: :normal) do
    table(
      data,
      position: :center,
      width: 550,
      column_widths: [275, 275],
      cell_style: { inline_format: true, padding: 10, align: :center }
    )
  end

end
