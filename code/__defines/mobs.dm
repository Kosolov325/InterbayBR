// /mob/var/stat things.
#define CONSCIOUS   0
#define UNCONSCIOUS 1
#define DEAD        2

// Bitflags defining which status effects could be or are inflicted on a mob.
#define CANSTUN     0x1
#define CANWEAKEN   0x2
#define CANPARALYSE 0x4
#define CANPUSH     0x8
#define LEAPING     0x10
#define PASSEMOTES  0x32    // Mob has a cortical borer or holders inside of it that need to see emotes.
#define GODMODE     0x1000
#define FAKEDEATH   0x2000  // Replaces stuff like changeling.changeling_fakedeath.
#define NO_ANTAG    0x4000  // Players are restricted from gaining antag roles when occupying this mob
#define XENO_HOST   0x8000  // Tracks whether we're gonna be a baby alien's mummy.

// Grab levels.
#define GRAB_PASSIVE    1
#define GRAB_AGGRESSIVE 2
#define GRAB_NECK       3
#define GRAB_UPGRADING  4
#define GRAB_KILL       5

#define BORGMESON 0x1
#define BORGTHERM 0x2
#define BORGXRAY  0x4
#define BORGMATERIAL  8

#define HOSTILE_STANCE_IDLE      1
#define HOSTILE_STANCE_ALERT     2
#define HOSTILE_STANCE_ATTACK    3
#define HOSTILE_STANCE_ATTACKING 4
#define HOSTILE_STANCE_TIRED     5
#define HOSTILE_STANCE_INSIDE    6

#define LEFT  1
#define RIGHT 2

// Pulse levels, very simplified.
#define PULSE_NONE    0 // So !M.pulse checks would be possible.
#define PULSE_SLOW    1 // <60     bpm
#define PULSE_NORM    2 //  60-90  bpm
#define PULSE_FAST    3 //  90-120 bpm
#define PULSE_2FAST   4 // >120    bpm
#define PULSE_THREADY 5 // Occurs during hypovolemic shock
#define GETPULSE_HAND 0 // Less accurate. (hand)
#define GETPULSE_TOOL 1 // More accurate. (med scanner, sleeper, etc.)

//intent flags, why wasn't this done the first time?
#define I_HELP		"help"
#define I_DISARM	"disarm"
#define I_GRAB		"grab"
#define I_HURT		"harm"
#define I_DODGE		"dodge"
#define I_PARRY		"parry"

//These are used Bump() code for living mobs, in the mob_bump_flag, mob_swap_flags, and mob_push_flags vars to determine whom can bump/swap with whom.
#define HUMAN 1
#define MONKEY 2
#define ALIEN 4
#define ROBOT 8
#define SLIME 16
#define SIMPLE_ANIMAL 32
#define HEAVY 64
#define ALLMOBS (HUMAN|MONKEY|ALIEN|ROBOT|SLIME|SIMPLE_ANIMAL|HEAVY)

// Robot AI notifications
#define ROBOT_NOTIFICATION_NEW_UNIT 1
#define ROBOT_NOTIFICATION_NEW_NAME 2
#define ROBOT_NOTIFICATION_NEW_MODULE 3
#define ROBOT_NOTIFICATION_MODULE_RESET 4

// Appearance change flags
#define APPEARANCE_UPDATE_DNA  0x1
#define APPEARANCE_RACE       (0x2|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_GENDER     (0x4|APPEARANCE_UPDATE_DNA)
#define APPEARANCE_SKIN        0x8
#define APPEARANCE_HAIR        0x10
#define APPEARANCE_HAIR_COLOR  0x20
#define APPEARANCE_FACIAL_HAIR 0x40
#define APPEARANCE_FACIAL_HAIR_COLOR 0x80
#define APPEARANCE_EYE_COLOR 0x100
#define APPEARANCE_ALL_HAIR (APPEARANCE_HAIR|APPEARANCE_HAIR_COLOR|APPEARANCE_FACIAL_HAIR|APPEARANCE_FACIAL_HAIR_COLOR)
#define APPEARANCE_ALL       0xFFFF

// Click cooldown
#define DEFAULT_SLOW_COOLDOWN	16 //The default cooldown for slow actions.
#define DEFAULT_ATTACK_COOLDOWN 8 //Default timeout for aggressive actions
#define DEFAULT_QUICK_COOLDOWN  4


#define MIN_SUPPLIED_LAW_NUMBER 15
#define MAX_SUPPLIED_LAW_NUMBER 50

#define MAX_SUPPLIED_LAW_NUMBER 50

// NT's alignment towards the character
#define COMPANY_LOYAL 			"Loyal"
#define COMPANY_SUPPORTATIVE	"Supportive"
#define COMPANY_NEUTRAL 		"Neutral"
#define COMPANY_SKEPTICAL		"Skeptical"
#define COMPANY_OPPOSED			"Opposed"

//RELIGIONS
#define LEGAL_RELIGION 			"Deo Machina"
#define ILLEGAL_RELIGION 		"Old Gods"
#define NARSIE_RELIGION			"Narsie"

#define COMPANY_ALIGNMENTS		list(COMPANY_LOYAL,COMPANY_SUPPORTATIVE,COMPANY_NEUTRAL,COMPANY_SKEPTICAL,COMPANY_OPPOSED)

// Defines mob sizes, used by lockers and to determine what is considered a small sized mob, etc.
#define MOB_LARGE  		40
#define MOB_MEDIUM 		20
#define MOB_SMALL 		10
#define MOB_TINY 		5
#define MOB_MINISCULE	1

// Gluttony levels.
#define GLUT_TINY 1       // Eat anything tiny and smaller
#define GLUT_SMALLER 2    // Eat anything smaller than we are
#define GLUT_ANYTHING 4   // Eat anything, ever

#define GLUT_ITEM_TINY 8         // Eat items with a w_class of small or smaller
#define GLUT_ITEM_NORMAL 16      // Eat items with a w_class of normal or smaller
#define GLUT_ITEM_ANYTHING 32    // Eat any item
#define GLUT_PROJECTILE_VOMIT 64 // When vomitting, does it fly out?

// Devour speeds, returned by can_devour()
#define DEVOUR_SLOW 1
#define DEVOUR_FAST 2

#define TINT_NONE 0
#define TINT_MODERATE 1
#define TINT_HEAVY 2
#define TINT_BLIND 3

#define FLASH_PROTECTION_VULNERABLE -2
#define FLASH_PROTECTION_REDUCED -1
#define FLASH_PROTECTION_NONE 0
#define FLASH_PROTECTION_MODERATE 1
#define FLASH_PROTECTION_MAJOR 2

#define ANIMAL_SPAWN_DELAY round(config.respawn_delay / 6)
#define DRONE_SPAWN_DELAY  round(config.respawn_delay / 3)

// Incapacitation flags, used by the mob/proc/incapacitated() proc
#define INCAPACITATION_NONE 0
#define INCAPACITATION_RESTRAINED 1
#define INCAPACITATION_BUCKLED_PARTIALLY 2
#define INCAPACITATION_BUCKLED_FULLY 4
#define INCAPACITATION_STUNNED 8
#define INCAPACITATION_FORCELYING 16 //needs a better name - represents being knocked down BUT still conscious.
#define INCAPACITATION_KNOCKOUT 32

#define INCAPACITATION_KNOCKDOWN (INCAPACITATION_KNOCKOUT|INCAPACITATION_FORCELYING)
#define INCAPACITATION_DISABLED (INCAPACITATION_KNOCKDOWN|INCAPACITATION_STUNNED)
#define INCAPACITATION_DEFAULT (INCAPACITATION_RESTRAINED|INCAPACITATION_BUCKLED_FULLY|INCAPACITATION_DISABLED)
#define INCAPACITATION_ALL (~INCAPACITATION_NONE)

// Organs.
#define BP_MOUTH    "mouth"
#define BP_EYES     "eyes"
#define BP_HEART    "heart"
#define BP_LUNGS    "lungs"
#define BP_BRAIN    "brain"
#define BP_LIVER    "liver"
#define BP_KIDNEYS  "kidneys"
#define BP_PLASMA   "plasma vessel"
#define BP_STACK    "stack"
#define BP_APPENDIX "appendix"
#define BP_CELL     "cell"
#define BP_OPTICS   "optics"
#define BP_HIVE     "hive node"
#define BP_NUTRIENT "nutrient vessel"
#define BP_ACID     "acid gland"
#define BP_EGG      "egg sac"
#define BP_RESIN    "resin spinner"
#define BP_STRATA   "neural strata"
#define BP_RESPONSE "response node"
#define BP_GBLADDER "gas bladder"
#define BP_POLYP    "polyp segment"
#define BP_ANCHOR   "anchoring ligament"
#define BP_THROAT 	"throat"
#define BP_VCHORDS  "vocal chords"
#define BP_TONGUE	"tongue"

// Limbs.
#define BP_L_FOOT "l_foot"
#define BP_R_FOOT "r_foot"
#define BP_L_LEG  "l_leg"
#define BP_R_LEG  "r_leg"
#define BP_L_HAND "l_hand"
#define BP_R_HAND "r_hand"
#define BP_L_ARM  "l_arm"
#define BP_R_ARM  "r_arm"
#define BP_HEAD   "head"
#define BP_CHEST  "chest"
#define BP_GROIN  "groin"
#define BP_ALL_LIMBS list(BP_CHEST, BP_GROIN, BP_HEAD, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
#define BP_BY_DEPTH list(BP_HEAD, BP_L_HAND, BP_R_HAND, BP_L_ARM, BP_R_ARM, BP_L_FOOT, BP_R_FOOT, BP_L_LEG, BP_R_LEG, BP_GROIN, BP_CHEST)

#define SYNTH_BLOOD_COLOUR "#030303"
#define SYNTH_FLESH_COLOUR "#575757"

#define MOB_PULL_NONE 0
#define MOB_PULL_SMALLER 1
#define MOB_PULL_SAME 2
#define MOB_PULL_LARGER 3

//carbon taste sensitivity defines, used in mob/living/carbon/proc/ingest
#define TASTE_HYPERSENSITIVE 3 //anything below 5%
#define TASTE_SENSITIVE 2 //anything below 7%
#define TASTE_NORMAL 1 //anything below 15%
#define TASTE_DULL 0.5 //anything below 30%
#define TASTE_NUMB 0.1 //anything below 150%

//Used by show_message() and emotes
#define VISIBLE_MESSAGE 1
#define AUDIBLE_MESSAGE 2

//used for getting species temp values
#define COLD_LEVEL_1 -1
#define COLD_LEVEL_2 -2
#define COLD_LEVEL_3 -3
#define HEAT_LEVEL_1 1
#define HEAT_LEVEL_2 2
#define HEAT_LEVEL_3 3

//Synthetic human temperature vals
#define SYNTH_COLD_LEVEL_1 50
#define SYNTH_COLD_LEVEL_2 -1
#define SYNTH_COLD_LEVEL_3 -1
#define SYNTH_HEAT_LEVEL_1 500
#define SYNTH_HEAT_LEVEL_2 1000
#define SYNTH_HEAT_LEVEL_3 2000

#define CORPSE_CAN_REENTER 1
#define CORPSE_CAN_REENTER_AND_RESPAWN 2

#define SPECIES_HUMAN "Human"
#define SPECIES_TAJARA "Tajara"
#define SPECIES_DIONA "Diona"
#define SPECIES_VOX "Vox"
#define SPECIES_IPC "Machine"
#define SPECIES_UNATHI "Unathi"
#define SPECIES_SKRELL "Skrell"
#define SPECIES_NABBER "Nabber"

#define SOCIAL_CLASS_MIN 1
#define SOCIAL_CLASS_MED 2
#define SOCIAL_CLASS_HIGH 3
#define SOCIAL_CLASS_MAX 4

#define SURGERY_CLOSED 0
#define SURGERY_OPEN 1
#define SURGERY_RETRACTED 2
#define SURGERY_ENCASED 3

#define STAMINA_EXHAUST 200

//Moods levels for humans
#define MOOD_LEVEL_HAPPY4 20
#define MOOD_LEVEL_HAPPY3 15
#define MOOD_LEVEL_HAPPY2 10
#define MOOD_LEVEL_HAPPY1 5
#define MOOD_LEVEL_NEUTRAL 0
#define MOOD_LEVEL_SAD1 -5
#define MOOD_LEVEL_SAD2 -10
#define MOOD_LEVEL_SAD3 -15
#define MOOD_LEVEL_SAD4 -20

#define NUTRITION_LEVEL_FAT 550
#define NUTRITION_LEVEL_FULL 500
#define NUTRITION_LEVEL_WELL_FED 450
#define NUTRITION_LEVEL_FED 350
#define NUTRITION_LEVEL_HUNGRY 250
#define NUTRITION_LEVEL_STARVING 150

//Thirst levels for humans
#define THIRST_LEVEL_MAX 600
#define THIRST_LEVEL_FILLED 500
#define THIRST_LEVEL_MEDIUM 300
#define THIRST_LEVEL_THIRSTY 200
#define THIRST_LEVEL_DEHYDRATED 50
#define THIRST_FACTOR 0.5

//Hygiene levels for humans
#define HYGIENE_LEVEL_CLEAN 250
#define HYGIENE_LEVEL_NORMAL 200
#define HYGIENE_LEVEL_DIRTY 75
#define HYGIENE_FACTOR_LOWEST 0.09
#define HYGIENE_FACTOR 0.1
#define HYGIENE_FACTOR_HIGHEST 0.110

//Disgust levels for humans
#define DISGUST_LEVEL_MAXEDOUT 150
#define DISGUST_LEVEL_DISGUSTED 75
#define DISGUST_LEVEL_VERYGROSS 50
#define DISGUST_LEVEL_GROSS 25

//Hardcore mode stuff

#define STARVATION_MIN 60 //If you have less nutrition than this value, the hunger indicator starts flashing
#define STARVATION_NOTICE 45 //If you have more nutrition than this value, you get an occasional message reminding you that you're going to starve soon
#define STARVATION_WEAKNESS 20 //Otherwise, if you have more nutrition than this value, you occasionally become weak and receive minor damage
#define STARVATION_NEARDEATH 5 //Otherwise, if you have more nutrition than this value, you have seizures and occasionally receive damage

//If you have less nutrition than STARVATION_NEARDEATH, you start getting damage
#define STARVATION_OXY_DAMAGE 2.5
#define STARVATION_TOX_DAMAGE 2.5
#define STARVATION_BRAIN_DAMAGE 2.5

#define STARVATION_OXY_HEAL_RATE 1 //While starving, THIS much oxygen damage is restored per life tick (instead of the default 5)

//Temperature stuff
//BODYTEMP_COLD_DAMAGE_LIMIT 			 -13�C Below which freezing damage occurs.						(defined in items_clothing.dm)
#define TEMPERATURE_REFRESHING 	278.15	//5�C  Below which drinks and foods are considered refreshing.
#define TEMPERATURE_WARM 		323.15	//50�C Above which drinks and foods are considered warm.
//BODYTEMP_HEAT_DAMAGE_LIMIT 			  87�C Above which burn damage occurs.							(defined in items_clothing.dm)