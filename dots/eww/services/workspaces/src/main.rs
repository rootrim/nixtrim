use hyprland::event_listener::EventListener;
use hyprland::shared::HyprData;
use hyprland::shared::HyprDataVec;
use serde::Serialize;
use std::io::Write;

#[derive(Serialize, Debug)]
struct SimpleWorkspace {
    id: i32,
    name: String,
    focused: bool,
}

fn main() -> hyprland::Result<()> {
    if let Ok(simple_workspaces) = get_workspaces() {
        if let Ok(json) = workspaces_to_json(&simple_workspaces) {
            println!("{json}");
            std::io::stdout().flush().unwrap();
        }
    }

    let mut listener = EventListener::new();
    listener.add_workspace_changed_handler(|_data| {
        if let Ok(simple_workspaces) = get_workspaces() {
            if let Ok(json) = workspaces_to_json(&simple_workspaces) {
                println!("{json}");
                std::io::stdout().flush().unwrap();
            }
        }
    });
    listener.start_listener()?;
    Ok(())
}

fn get_workspaces() -> hyprland::Result<Vec<SimpleWorkspace>> {
    let active_workspace_id = hyprland::data::Monitors::get()?
        .to_vec()
        .first()
        .map(|monitor| monitor.active_workspace.id)
        .unwrap_or(0);
    let workspaces = hyprland::data::Workspaces::get()?.to_vec();
    let mut simple_workspaces: Vec<SimpleWorkspace> = workspaces
        .iter()
        .filter(|workspace| {
            workspace.id > 0 && (workspace.windows > 0 || workspace.id == active_workspace_id)
        })
        .map(|workspace| SimpleWorkspace {
            id: workspace.id,
            name: int_to_kanji(workspace.id),
            focused: workspace.id == active_workspace_id,
        })
        .collect();
    simple_workspaces.sort_by_key(|workspace| workspace.id);
    Ok(simple_workspaces)
}

fn workspaces_to_json(simple_workspaces: &[SimpleWorkspace]) -> hyprland::Result<String> {
    Ok(serde_json::to_string(simple_workspaces)?)
}

fn int_to_kanji(num: i32) -> String {
    match num {
        0 => "零".to_string(),
        1 => "一".to_string(),
        2 => "二".to_string(),
        3 => "三".to_string(),
        4 => "四".to_string(),
        5 => "五".to_string(),
        6 => "六".to_string(),
        7 => "七".to_string(),
        8 => "八".to_string(),
        9 => "九".to_string(),
        10 => "十".to_string(),
        _ => num.to_string(),
    }
}
