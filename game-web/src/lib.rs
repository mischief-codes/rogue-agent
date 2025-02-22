use game_core::{LocationType, WorldMap};

pub struct WebRenderer;

impl WebRenderer {
    fn location_type_to_emoji(location_type: &LocationType) -> &'static str {
        match location_type {
            LocationType::Residential => "🏠",
            LocationType::Commercial => "🏢",
            LocationType::Industrial => "🏭",
            LocationType::Park => "🌳",
        }
    }

    fn location_type_to_color(location_type: &LocationType) -> &'static str {
        match location_type {
            LocationType::Residential => "#90EE90",
            LocationType::Commercial => "#ADD8E6",
            LocationType::Industrial => "#FFB6C1",
            LocationType::Park => "#228B22",
        }
    }

    pub fn render_world(world: &WorldMap) -> String {
        let mut html = String::from(Self::get_header());

        // Render grid
        for y in 0..world.height {
            for x in 0..world.width {
                if let Some(location_type) = world.get_location(x, y) {
                    html.push_str(&format!(
                        r#"<div class="cell" style="background-color: {}">{}</div>"#,
                        Self::location_type_to_color(&location_type),
                        Self::location_type_to_emoji(&location_type)
                    ));
                }
            }
        }

        html.push_str(Self::get_footer());
        html
    }

    fn get_header() -> &'static str {
        r#"
        <!DOCTYPE html>
        <html>
            <head>
                <title>City Builder</title>
                <style>
                    .grid {
                        display: grid;
                        grid-template-columns: repeat(10, 50px);
                        gap: 2px;
                        background-color: #ccc;
                        padding: 2px;
                    }
                    .cell {
                        width: 50px;
                        height: 50px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 2em;
                    }
                </style>
            </head>
            <body>
                <h1>City Map</h1>
                <div class="grid">
        "#
    }

    fn get_footer() -> &'static str {
        r#"
                </div>
                <div style="margin-top: 20px">
                    <p>Legend:</p>
                    <p>🏠 Residential</p>
                    <p>🏢 Commercial</p>
                    <p>🏭 Industrial</p>
                    <p>🌳 Park (2x2)</p>
                </div>
            </body>
        </html>
        "#
    }
}
