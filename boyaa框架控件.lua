-- 按钮
	--[[
	local Button = import("babe/ui/widget").Button
    local Window = import("babe/window")
	local btn = Button{
	    label = 'test', -- 文本内容
	    label_style = { -- 文本样式
	        tint_color = 'red',
	    },
	    down_style = {  -- 按下样式
	        tint_color = 'gray',
	    },
	    padding = 20,   -- 文本边距
	    slice9 = 10,    -- 圆角弧度
	    on_click = function(self)
	        print('button on click')
	    end,
	}
	Window.main_window:add(btn)
	--开关
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	local s = Widget.Switch{
	    on_change = function(self, on)
	        print('switch on change', on)
	    end
	}
	Window.main_window:add(s)
	-- 单选按钮组
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	local RunLoop = import("babe/scheduler/runloop")
	local g = Widget.SelectGroup(function(self, name)
	    print('on change', name)
	end)
	local l = Widget.View{
	    flex_direction = YGFlexDirectionRow,
	}
	for i=1, 5 do
	    local s = Widget.Switch{}
	    l:add(s)
	    g:add(s, 'switch'..i)
	end
	for i=1, 5 do
	    local s = Widget.Checkbox{
	        label = 'checkbox' .. i,
	        on_style = { -- 选中状态
	            content_color = 'red',
	        },
	    }
	    l:add(s)
	    g:add(s, 'checkbox'..i)
	end
	Window.main_window:add(l)
	-- 进度条
	local Widget = import("babe/ui/widget")
	local RunLoop = import("babe/scheduler/runloop")
	local p = Widget.Progress{
	    content_color = 'blue',
	    front_style = {
	        content_color = 'red',
	    },
	}
	RunLoop.enqueue(function()
	    p.value = 0.5
	end)
	
	local Window = import("babe/window")
	local Widget = import("babe/ui/widget")
	local slider = Widget.Slider{
	    progress_style = {
	        content_color = 'blue',
	        front_style = {
	            content_color = 'red',
	        },
	    },
	    thumb_style = {
	        unit = 'slider_thumb.png',
	        set_unit_size = true,
	    },
	    on_change = function(self, v)
	        print('on change', v)
	    end,
	}
	Window.main_window:add(p)
	Window.main_window:add(slider)
	-- 单选按钮组
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	local popup = Widget.ButtonGroup{
	    button_style = {
	        content_color = 'blue',
	    },
	    buttons = {
	        {label='测试1', name='test1'},
	        {label='测试2', name='test2'},
	        {label='测试3', name='test3'},
	        {label='测试4', name='test4'},
	    },
	    value = 'test2',
	    on_change = function(self, value)
	        print('on change', value)
	    end,
	}
	Window.main_window:add(popup)
	--一个模拟iOS无限旋转的表示加载中的小动画。
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	Window.main_window:add(Widget.Loading{style=Widget.LoadingStyle.White})
	-- 金币特效(无效)
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	Window.main_window:add(Widget.ParticleView{
	    delegate = {
	        on_stop = function(self)
	            self:reset()
	        end,
	    },
	    code = string.dump(money_drop_particle),-- 这里应该是没有导入string包导致dump()用不了
	})	
	-- 网格布局
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	Window.main_window:add(Widget.GridView{
	    code = string.dump(grid_function),
	})	
	-- alpha值测试，未成功
	local Shader = import("babe/graphics/shader")
	local Widget = import("babe/ui/widget")
	local Window = import("babe/window")
	local vs, _, uniforms = unpack(Shader.get_default_shader_desc()) -- 顶点着色器]]--
	-- 片段着色器
	--local fs = [[													
	--uniform float alpha;
	--void main()
	--{
	--    // 带半透明的红色。
	--    gl_FragColor = vec4(1, 0, 0, alpha);
	--}
	--]]
	--[[
	table.insert(uniforms, {'alpha', GL_FLOAT, 1, Shader.uniform_value_float(0)})
	local shader_id = Shader.register_shader{
	    vs, fs, uniforms
	}
	local v = Widget.View{
	    unit = 'white',
	    flex = 1,
	    shader = shader_id,
	    uniforms = {
	        alpha = Shader.uniform_value_float(0.5),
	    },
	}
	Window.main_window:add(v)]]--