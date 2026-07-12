using RazorLight;

var templatePath = Path.Combine(
    AppContext.BaseDirectory,
    "Templates");

var engine = new RazorLightEngineBuilder()
    .UseFileSystemProject(templatePath)
    .UseMemoryCachingProvider()
    .Build();

var html = await engine.CompileRenderAsync(
    "index.cshtml",
    new { });

Directory.CreateDirectory("../../../wwwroot");

await File.WriteAllTextAsync(
    "../../../wwwroot/index.html",
    html);

Console.WriteLine("Generated wwwroot/index.html");