use rand::Rng;
use std::sync::Arc;

#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Position {
    pub x: usize,
    pub y: usize,
}

#[derive(Clone, Copy, PartialEq, Debug)]
pub enum LocationType {
    Residential,
    Commercial,
    Industrial,
    Park,
}

#[derive(Clone)]
pub struct Location {
    pub location_type: LocationType,
    pub size: (usize, usize),
    pub position: Position,
}

#[derive(Clone)]
pub struct WorldMap {
    grid: Arc<Vec<Vec<Option<LocationType>>>>,
    pub locations: Arc<Vec<Location>>,
    pub width: usize,
    pub height: usize,
}

impl WorldMap {
    pub fn new(width: usize, height: usize) -> Self {
        let mut rng = rand::thread_rng();
        let mut grid = vec![vec![None; width]; height];
        let mut locations = Vec::new();

        // Helper function to check if area is free
        fn is_area_free(
            grid: &[Vec<Option<LocationType>>],
            x: usize,
            y: usize,
            w: usize,
            h: usize,
        ) -> bool {
            if x + w > grid[0].len() || y + h > grid.len() {
                return false;
            }
            for dy in 0..h {
                for dx in 0..w {
                    if grid[y + dy][x + dx].is_some() {
                        return false;
                    }
                }
            }
            true
        }

        // Helper function to fill area
        fn fill_area(
            grid: &mut [Vec<Option<LocationType>>],
            x: usize,
            y: usize,
            w: usize,
            h: usize,
            loc_type: LocationType,
        ) {
            for dy in 0..h {
                for dx in 0..w {
                    grid[y + dy][x + dx] = Some(loc_type);
                }
            }
        }

        // First, try to place some parks (2x2)
        for _ in 0..3 {
            // Try to place 3 parks
            let x = rng.gen_range(0..width - 1);
            let y = rng.gen_range(0..height - 1);
            if is_area_free(&grid, x, y, 2, 2) {
                fill_area(&mut grid, x, y, 2, 2, LocationType::Park);
                locations.push(Location {
                    location_type: LocationType::Park,
                    size: (2, 2),
                    position: Position { x, y },
                });
            }
        }

        // Fill remaining spaces with single-tile locations
        let single_types = [
            LocationType::Residential,
            LocationType::Commercial,
            LocationType::Industrial,
        ];

        grid.iter_mut()
            .enumerate()
            .take(height)
            .for_each(|(y, row)| {
                row.iter_mut()
                    .enumerate()
                    .take(width)
                    .for_each(|(x, cell)| {
                        if cell.is_none() {
                            let loc_type = *single_types.get(rng.gen_range(0..3)).unwrap();
                            *cell = Some(loc_type);
                            locations.push(Location {
                                location_type: loc_type,
                                size: (1, 1),
                                position: Position { x, y },
                            });
                        }
                    });
            });
        WorldMap {
            grid: Arc::new(grid),
            locations: Arc::new(locations),
            width,
            height,
        }
    }

    pub fn get_location(&self, x: usize, y: usize) -> Option<LocationType> {
        self.grid[y][x]
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_world_creation() {
        let world = WorldMap::new(10, 10);
        assert_eq!(world.width, 10);
        assert_eq!(world.height, 10);
    }
}
