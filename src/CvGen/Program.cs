using System.Text.Json;
using RazorLight;

var appRoot = AppContext.BaseDirectory;

var templateRoot = Path.Combine(appRoot, "Templates");
var outputRoot = Path.Combine(appRoot, "wwwroot");

Directory.CreateDirectory(outputRoot);

var itemsJson = await File.ReadAllTextAsync(
    Path.Combine(appRoot, "Data", "items.json"));

var items = JsonSerializer.Deserialize<List<string>>(itemsJson)
            ?? [];

var model = new
{
    Items = items
};

var engine = new RazorLightEngineBuilder()
    .UseFileSystemProject(templateRoot)
    .UseMemoryCachingProvider()
    .Build();

var html = await engine.CompileRenderAsync(
    "index.cshtml",
    model);

await File.WriteAllTextAsync(
    Path.Combine(outputRoot, "index.html"),
    html);