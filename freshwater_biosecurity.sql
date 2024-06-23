CREATE DATABASE IF NOT EXISTS freshwater_biosecurity;
USE freshwater_biosecurity;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash CHAR(255) NOT NULL,
    user_type ENUM('admin', 'staff', 'river_user') NOT NULL,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) DEFAULT NULL,
    email VARCHAR(255) DEFAULT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    address TEXT,
    river_users_id VARCHAR(255), 
    staff_number VARCHAR(255), 
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    position VARCHAR(255) DEFAULT NULL, 
    department VARCHAR(255) DEFAULT NULL, 
    status ENUM('active', 'inactive') DEFAULT 'active' NOT NULL
);

CREATE TABLE IF NOT EXISTS sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(255) NOT NULL,
    source_url VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS freshwater_guide (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_type ENUM('pest', 'disease') NOT NULL,
    present_in_nz ENUM('yes', 'no') NOT NULL,
    common_name VARCHAR(255) NOT NULL,
    scientific_name VARCHAR(255),
    key_characteristics TEXT,
    biology_description TEXT,
    impacts TEXT,
    primary_image TEXT,
    additional_image TEXT,
    source_id INT,
    FOREIGN KEY (source_id) REFERENCES sources(id)
);

CREATE TABLE IF NOT EXISTS images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guide_item_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN NOT NULL,
    FOREIGN KEY (guide_item_id) REFERENCES freshwater_guide(id) ON DELETE CASCADE
);

INSERT INTO sources (source_name, source_url) VALUES
('Exotic Pests and Diseases in New Zealand', 'https://www.mpi.govt.nz/biosecurity/exotic-pests-and-diseases-in-newzealand/freshwater-pests-and-diseases-in-nz/'),
('DOC Freshwater Pests', 'https://www.doc.govt.nz/nature/pests-and-threats/freshwater-pests/'),
('DOC Other Freshwater Pest Species', 'https://www.doc.govt.nz/nature/pests-and-threats/freshwater-pests/otherfreshwater-pest-species/'),
('Pests and Diseases Not in New Zealand', 'https://www.mpi.govt.nz/biosecurity/pests-and-diseases-not-in-newzealand/freshwater-pests-and-diseases-not-in-nz/'),
('NIWA Report', 'https://docs.niwa.co.nz/library/public/NIWAsts49.pdf');


INSERT INTO users (username, river_users_id, password_hash, user_type, date_joined, first_name, last_name, email, phone_number, address, status) 
VALUES 
  ('riveruser1', 'R001', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'river_user', DEFAULT, 'AA', 'BB', 'R001@gmail.com', '020000000', '1 Lincoln Road', 'active'),
  ('riveruser2', 'R002', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'river_user', DEFAULT, 'CC', 'DD', 'R002@gmail.com', '021111111', '2 Lincoln Road', 'active'),
  ('riveruser3', 'R003', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'river_user', DEFAULT, 'EE', 'FF', 'R003@gmail.com', '022222222', '3 Lincoln Road', 'active'),
  ('riveruser4', 'R004', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'river_user', DEFAULT, 'GG', 'HH', 'R004@gmail.com', '023333333', '4 Lincoln Road', 'active'),
  ('riveruser5', 'R005', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'river_user', DEFAULT, 'II', 'JJ', 'R005@gmail.com', '024444444', '5 Lincoln Road', 'active');

INSERT INTO users (username, staff_number, password_hash, user_type, date_joined, first_name, last_name, email, phone_number, address, position, department, status) 
VALUES 
  ('admin', 'A001', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'admin', DEFAULT, 'admin1', 'User1', 'admin1@gmail.com', '091000001', '1 lincoln street', 'manager', 'Office', 'active');


INSERT INTO users (username, staff_number, password_hash, user_type, date_joined, first_name, last_name, email, phone_number, address, position, department, status) 
VALUES 
  ('staff1', 'S001', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'staff', DEFAULT, 'staff2', 'User2', 'staff2@gmail.com', '090000002', '2 lincoln street', 'assistant', 'research', 'active'),
  ('staff2', 'S002', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'staff', DEFAULT, 'staff3', 'User3', 'staff3@gmail.com', '090000003', '3 lincoln street', 'officer', 'policy', 'active'),
  ('staff3', 'S003', '$2b$12$fPYAiPn9ZAdbDHmKbpzpe.sP36IWuDgf9s2c1rGc.1YxAZKN0ph46', 'staff', DEFAULT, 'staff4', 'User4', 'staff4@gmail.com', '090000004', '4 lincoln street', 'consultant', 'training', 'active');

INSERT INTO freshwater_guide (item_type, present_in_nz, common_name, scientific_name, key_characteristics, biology_description, impacts, primary_image, additional_image, source_id) VALUES
('disease', 'yes', 'Myrtle rust', 'Austropuccinia psidii', 'Yellow spores on leaves', 'Myrtle rust affects plants in the Myrtaceae family, including iconic New Zealand species like pohutukawa and manuka.', 'Can cause defoliation and impact ecosystems and honey production.', 'myrtle_rust_primary.jpg', 'myrtle_rust_additional.jpg', 1),
('pest', 'yes', 'Koi carp', 'Cyprinus carpio', 'Large, gold-colored fish', 'Koi carp are an invasive fish species that outcompete native fish for food and habitat.', 'Can disrupt aquatic ecosystems and impact native fish populations.', 'koi_carp_primary.jpg', 'koi_carp_additional.jpg', 4),
('disease', 'yes', 'Didymo', 'Didymosphenia geminata', 'Blooms as brownish clumps on riverbeds', 'Didymo is a diatom and can form large, persistent blooms, smothering rocks and riverbeds.', 'Impacts include altered ecosystems and negative effects on trout habitats.', 'didymo_primary.jpg', 'didymo_additional.jpg', 3),
('pest', 'yes', 'Brown marmorated stink bug', 'Halyomorpha halys', 'Distinctive shield shape, brown color', 'Stink bugs are agricultural pests that feed on a wide variety of crops, including fruit trees and vegetables.', 'Can cause significant damage to crops and impact agriculture.', 'brown_marmorated_stink_bug_primary.jpg', 'brown_marmorated_stink_bug_additional.jpg', 5),
('disease', 'yes', 'Pseudomonas syringae pv actinidiae', 'Pseudomonas syringae pv actinidiae', 'Causes cankers on kiwi vines', 'PSA is a bacterial pathogen that affects kiwifruit vines, leading to cankers and dieback.', 'Significant economic impact on the kiwifruit industry.', 'pseudomonas_syringae_pv_actinidiae_primary.jpg', 'pseudomonas_syringae_pv_actinidiae_additional.jpg', 2),
('pest', 'yes', 'Common wasp', 'Vespula vulgaris', 'Yellow and black stripes, distinctive waist', 'Common wasps are aggressive predators that impact native insect populations and can be a nuisance to humans.', 'Can disrupt ecosystems and pose a threat to biodiversity.', 'common_wasp_primary.jpg', 'common_wasp_additional.jpg', 1),
('disease', 'yes', 'Ampelovirus Grapevine Leafroll', 'Grapevine leafroll-associated virus', 'Leaf discoloration and curling', 'Grapevine leafroll disease affects grapevines, leading to reduced grape quality and yield.', 'Economic impact on the wine industry.', 'ampelovirus_grapevine_leafroll_primary.jpg', 'ampelovirus_grapevine_leafroll_additional.jpg', 2),
('pest', 'yes', 'Himalayan tahr', 'Hemitragus jemlahicus', 'Large herbivorous mammal', 'Himalayan tahrs are herbivores that can overgraze native vegetation, leading to habitat degradation.', 'Impacts on alpine ecosystems and native plant species.', 'himalayan_tahr_primary.jpg', 'himalayan_tahr_additional.jpg', 4),
('disease', 'yes', 'Ceratocystis fimbriata', 'Ceratocystis fimbriata', 'Causes wilt disease in susceptible hosts', 'Ceratocystis fimbriata is a plant pathogen that causes wilt disease in various host plants.', 'Can lead to wilting and death of infected plants.', 'ceratocystis_fimbriata_primary.jpg', 'ceratocystis_fimbriata_additional.jpg', 2),
('pest', 'yes', 'Ruddy duck', 'Oxyura jamaicensis', 'Small diving duck', 'Ruddy ducks are invasive birds that can outcompete native waterfowl for resources.', 'Impact on native bird populations and disruption of ecosystems.', 'ruddy_duck_primary.jpg', 'ruddy_duck_additional.jpg', 5),
('disease', 'yes', 'Fusarium circinatum', 'Fusarium circinatum', 'Causes pitch canker disease', 'Pitch canker affects various pine species, causing resinous lesions on stems and branches.', 'Economic impact on forestry and ecological impact on pine ecosystems.', 'fusarium_circinatum_primary.jpg', 'fusarium_circinatum_additional.jpg', 3),
('pest', 'yes', 'Nile perch', 'Lates niloticus', 'Large predatory fish', 'Nile perch is an invasive fish species that can lead to declines in native fish populations.', 'Impact on aquatic ecosystems and fisheries.', 'nile_perch_primary.jpg', 'nile_perch_additional.jpg', 1),
('pest', 'no', 'Zebra mussel', 'Dreissena polymorpha', 'Small, D-shaped shells', 'Zebra mussels are invasive shellfish that attach to surfaces, clogging water pipes and displacing native species.', 'Significant economic and ecological impact on water systems.', 'zebra_mussel_primary.jpg', 'zebra_mussel_additional.jpg', 4),
('disease', 'no', 'Chytridiomycosis', 'Batrachochytrium dendrobatidis', 'Skin discoloration and shedding', 'Chytridiomycosis is a fungal disease that affects amphibians, causing skin abnormalities and lethality.', 'Can lead to declines in amphibian populations and disrupt ecosystems.', 'chytridiomycosis_primary.jpg', 'chytridiomycosis_additional.jpg', 2),
('pest', 'no', 'Red eared slider', 'Trachemys scripta elegans', 'Distinctive red stripe behind the eye', 'Red-eared sliders are invasive turtles that compete with native species and impact aquatic ecosystems.', 'Can outcompete native turtles and disrupt aquatic ecosystems.', 'red_eared_slider_primary.jpg', 'red_eared_slider_additional.jpg', 1),
('pest', 'no', 'Northern snakehead', 'Channa argus', 'Long, cylindrical body with snake-like head', 'Northern snakeheads are invasive fish that prey on native species and can survive in various habitats.', 'Impact on native fish populations and aquatic ecosystems.', 'northern_snakehead_primary.jpg', 'northern_snakehead_additional.jpg', 3),
('pest', 'no', 'European starling', 'Sturnus vulgaris', 'Black with white speckles', 'European starlings are invasive birds that outcompete native species for nest sites and food resources.', 'Can displace native bird species and impact ecosystems.', 'european_starling_primary.jpg', 'european_starling_additional.jpg', 1),
('disease', 'no', 'Olive fruit fly', 'Bactrocera oleae', 'Small, olive-shaped fly', 'Olive fruit flies are agricultural pests that infest olives, leading to crop damage and economic losses.', 'Significant impact on olive production and agriculture.', 'olive_fruit_fly_primary.jpg', 'olive_fruit_fly_additional.jpg', 2),
('pest', 'no', 'Asian longhorned beetle', 'Anoplophora glabripennis', 'Large beetle with long antennae', 'Asian longhorned beetles are invasive pests that bore into and damage hardwood trees.', 'Can cause tree mortality and impact forest ecosystems.', 'asian_longhorned_beetle_primary.jpg', 'asian_longhorned_beetle_additional.jpg', 4),
('disease', 'no', 'Citrus canker', 'Xanthomonas axonopodis', 'Lesions on citrus leaves and fruit', 'Citrus canker affects citrus trees, leading to blemished fruit and economic losses in the citrus industry.', 'Economic impact on citrus production.', 'citrus_canker_primary.jpg', 'citrus_canker_additional.jpg', 5);
