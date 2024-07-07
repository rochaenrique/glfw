project "glfw" 
	kind "staticlib"
	language "c"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	targetdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/glfw/glfw3.h",
		"include/glfw/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines 
		{ 
			"_glfw_win32",
			"_crt_secure_no_warnings"
		}
	
	filter "configurations:debug"
		runtime "degub" 
		symbols "on"
	
	filter "configurations:release"
		runtime "release" 
		optimize "on"
