extern crate exec;
extern crate nix;

fn main() {
    let root_uid = nix::unistd::Uid::from_raw(0);
    nix::unistd::setuid(root_uid).expect("Unable to suid");
    println!("Starting new vpn connection...");
    let err = exec::Command::new("/usr/sbin/openvpn")
        .arg("--config")
        .arg("/etc/openvpn/client/boomi-client.conf")
        .exec();
    println!("Error: {}", err);        
}
